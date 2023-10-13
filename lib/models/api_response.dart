class ApiResponse {
  final bool success;
  final String? errorMessage;
  final dynamic responseData;

  ApiResponse({
    required this.success,
    this.errorMessage,
    this.responseData,
  });
}
