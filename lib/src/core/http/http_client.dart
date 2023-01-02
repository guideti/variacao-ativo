import 'package:dio/dio.dart';

class HttpClient {
  Dio? _dio;
  BaseOptions options = BaseOptions(
    baseUrl: 'https://query2.finance.yahoo.com',
  );
  Dio instance() => _dio!;

  HttpClient() {
    _dio ??= Dio(options);
    _dio!.interceptors.add(QueuedInterceptorsWrapper(
        onError: (DioError error, ErrorInterceptorHandler handler) async {},
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          options.headers['Content-Type'] = 'application/json';
          options.headers['Accept-Language'] = 'pt-br';
          handler.next(options);
        }));
  }

  static Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final client = HttpClient();
    return client.instance().get(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
  }
}
