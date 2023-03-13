class NativeApiResponse {
  final Map<String, dynamic>? data;
  final Map<String, dynamic>? error;
  final Map<String, dynamic>? httpUrlResponse;
  final Map<String, dynamic>? errorMessage;

  NativeApiResponse({
    required this.data,
    required this.error,
    required this.httpUrlResponse,
    required this.errorMessage,
  });

  factory NativeApiResponse.fromJson(Map<String, dynamic> json) {
    return NativeApiResponse(
      data: json['data'],
      error: json['error'],
      httpUrlResponse: json['httpUrlResponse'],
      errorMessage: json['errorMessage'],
    );
  }
}
