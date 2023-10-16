class ApiResponse {
  final bool success;
  final String? errorMessage;
  final dynamic responseData;

  ApiResponse({
    required this.success,
    this.errorMessage,
    this.responseData,
  });

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': responseData,
    };
  }
}
