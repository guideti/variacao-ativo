class NetworkRequest {
  final String path;
  final HttpMethod httpMethod;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? parameters;
  final Encoding? encoding;

  NetworkRequest({
    required this.path,
    required this.httpMethod,
    this.headers,
    this.parameters,
    this.encoding,
  });
  
  Map<String, dynamic> toJson() {
  return {
    'path': path,
    'method': httpMethod.name.toUpperCase(),
    'headers': headers,
    'parameters': parameters,
    'encoding': encoding?.name.toUpperCase()
  };
}
}



enum Encoding {
  json,
  url,
}

enum HttpMethod {
  get,
  post,
  put,
  delete,
}
