import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});

  Future<Response> get({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    String? contentType,
  }) async {
    return await dio.get(
      url,
      data: body,
      queryParameters: params,
      options: Options(
        headers: headers,
        contentType: contentType,
      ),
    );
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    String? contentType,
  }) async {
    return await dio.post(
      url,
      data: body,
      queryParameters: params,
      options: Options(
        headers: headers,
        contentType: contentType,
      ),
    );
  }
}
