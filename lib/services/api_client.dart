import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://127.0.0.1:5000", // Flask backend URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  Dio get client => _dio;
}
