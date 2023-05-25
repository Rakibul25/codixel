import 'package:dio/dio.dart';
class API{
  Dio _dio = Dio();
  API(){
    _dio.options.baseUrl = "";
  }
  Dio get sendRequest => _dio;
}