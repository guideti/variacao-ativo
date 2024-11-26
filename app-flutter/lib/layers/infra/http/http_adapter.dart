import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import '../../../commons/exceptions/exceptions.dart';
import '../../data/http/http.dart';

import 'package:http/http.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
        {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
      );

    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);

    Future<Response>? futureResponse;
    try {
      if (method == 'post') {
        futureResponse = client.post(
          Uri.parse(url),
          headers: defaultHeaders,
          body: jsonBody,
        );
      } else if (method == 'get') {
        futureResponse = client.get(
          Uri.parse(url),
          headers: defaultHeaders,
        );
      } else if (method == 'put') {
        futureResponse = client.put(
          Uri.parse(url),
          headers: defaultHeaders,
          body: jsonBody,
        );
      } else if (method == 'delete') {
        futureResponse = client.delete(
          Uri.parse(url),
          headers: defaultHeaders,
          body: jsonBody,
        );
      }

      _handleRequest(url, method, defaultHeaders, body);

      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 30));
      }
    } on TimeoutException catch (error) {
      throw TimeoutRequestException(error.toString());
    } catch (error) {
      throw OtherRequestException(response.statusCode, error.toString());
    }
    return _handleResponse(response);
  }
}

_handleRequest(String url, String method, Map<String, String>? headers, Map<dynamic, dynamic>? body) {
  log(
    "*** REQUEST ****************************** REQUEST ***\n\n"
    "[${DateTime.now()}] | "
    "URL: $url | "
    "METHOD: $method | "
    "HEADERS: $headers | "
    "BODY: ${body ?? 'no-body'}"
    "\n\n*** REQUEST ****************************** REQUEST ***",
  );
}

dynamic _handleResponse(Response response) {
  var body = response.body.isEmpty ? null : jsonDecode(response.body);
  log(
    "*** RESPONSE ****************************** RESPONSE ***\n\n"
    "[${DateTime.now()}] | "
    "STATUS CODE: ${response.statusCode} | "
    "URL: ${response.request?.url} | "
    "METHOD: ${response.request?.method} | "
    "BODY: ${body ?? 'no-body'}"
    "\n\n*** RESPONSE ****************************** RESPONSE ***",
  );

  switch (response.statusCode) {
    case 200:
    case 201:
      return body;
    case 204:
      return null;
    case 400:
    case 422:
      throw BadRequestException.fromJson(body);
    case 401:
      throw const UnauthorizedRequestException();
    case 403:
      throw const ForbiddenRequestException();
    case 404:
      throw const NotFoundRequestException();
    default:
      throw OtherRequestException(response.statusCode);
  }
}
