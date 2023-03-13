class NativeApiResponse {
  final dynamic data;
  final int statusCode;
  final String? errorMessage;

  NativeApiResponse({
    required this.data,
    required this.statusCode,
    required this.errorMessage,
  });

  factory NativeApiResponse.fromJson(Map<String, dynamic> json) {
    return NativeApiResponse(
      data: json['data'],
      statusCode: json['statusCode'],
      errorMessage: json['errorMessage'],
    );
  }
}
