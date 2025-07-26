// core/api/api_manger.dart
import 'package:dio/dio.dart';
import 'ApiConstants.dart';


class ApiManager {
  final Dio _dio;

  ApiManager()
      : _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: {
      'Authorization': ApiConstants.apiKey,
    },
  ));

  Future<Response> getData(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
