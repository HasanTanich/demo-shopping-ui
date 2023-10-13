import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/models/api_response.dart';
import 'config/rest.dart';

enum ApiMethod {
  get,
  post,
  put,
  delete,
  patch,
}

class HttpAPI {
  static BuildContext? _context;

  HttpAPI({
    required BuildContext context,
  }) {
    _context = _context ?? context;
  }

  /// The method "makeAPIcall" receives two mandatory params which are:
  /// [Enum] ApiMethod, and [String] apiPath
  /// Params: body, contentType, headers, and [bool] authTokenRequired are optional
  /// The parameter authTokenRequired default value is set to true
  /// The method returns a future response of the [ApiResponse] type
  /// [ApiResponse] object contains information if the request was successful [bool] success
  /// [int] status code, [String] or [Null] errorMessage, and ([dynamic]/jsonObject) responseData
  static Future<ApiResponse> makeAPIcall(
    ApiMethod method,
    String apiPath, {
    Object? body,
    String? contentType,
    Map<String, String>? initHeaders,
  }) async {
    try {
      var currentDateTime = DateTime.now().toLocal();
      var apiUri = Uri.parse("${RestConfig.baseURL}$apiPath");

      log(
        "*****\nAPI-REQUEST: $apiUri\nREQUEST TIME: ${currentDateTime.hour.toString().padLeft(2, "0")}:${currentDateTime.minute.toString().padLeft(2, "0")}:${currentDateTime.second.toString().padLeft(2, "0")}\n*****",
        name: "HTTP API CALL",
      );

      const timeout = Duration(seconds: 100);

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: contentType ?? 'application/json',
        if (initHeaders != null) ...initHeaders
      };
      http.Response res;

      switch (method) {
        case ApiMethod.get:
          res = await http
              .get(
                apiUri,
                headers: headers,
              )
              .timeout(timeout);
          break;
        case ApiMethod.post:
          res = await http
              .post(
                apiUri,
                headers: headers,
                body: body == null ? null : jsonEncode(body),
              )
              .timeout(timeout);
          break;
        case ApiMethod.put:
          res = await http
              .put(
                apiUri,
                headers: headers,
                body: body == null ? null : jsonEncode(body),
              )
              .timeout(timeout);
          break;
        case ApiMethod.patch:
          res = await http
              .patch(
                apiUri,
                headers: headers,
                body: body == null ? null : jsonEncode(body),
              )
              .timeout(timeout);
          break;
        case ApiMethod.delete:
          res = await http
              .delete(
                apiUri,
                headers: headers,
                body: body == null ? null : jsonEncode(body),
              )
              .timeout(timeout);
          break;
      }

      var decodedRes = res.body.isNotEmpty ? jsonDecode(res.body) : null;

      if (res.statusCode == 200 ||
          res.statusCode == 201 ||
          res.statusCode == 202 ||
          (method == ApiMethod.patch && res.statusCode == 204)) {
        return ApiResponse(
          success: true,
          responseData: decodedRes,
        );
      }

      log(
        "*********HEADERS********\n$method\nHEADERS:\n${jsonEncode(headers)}\n${body != null ? "****PAYLOAD****\n${jsonEncode(body)}" : ""}",
        error: "****$apiPath****\nStatus code ${res.statusCode}\n${res.body}",
        name: "HTTP API CALL CRASH",
      );

      return ApiResponse(
        responseData: decodedRes,
        success: false,
        errorMessage: "API responded with Status Code ${res.statusCode}",
      );
    } catch (e) {
      log(
        "****/$apiPath****",
        error: e.toString(),
        name: "HTTP API CALL CRASH",
      );

      return ApiResponse(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
