import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.themoviedb.org/3/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    required String token,
    Map<String,String>? headers
  }) async {
    var response = await _dio.get(
        '$_baseUrl$endPoint',
      options:Options(
          headers: headers ?? {'Authorization': "Bearer $token"}
      )
    );
    return response.data;
  }
}