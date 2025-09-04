import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baserurl = "http://jsonplaceholder.typicode.com/todos";
 late  Response response;
} 