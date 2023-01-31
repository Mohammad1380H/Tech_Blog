import 'dart:developer';

import 'package:dio/dio.dart';

class DioServices {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = "application/json";
    var response = await dio.get(url,
        options: Options(responseType: ResponseType.json, method: 'GET'));
    return response;
  }
}

// class DioServices {
//   Future<dynamic> getMethod(String url) async {
//     Dio dio = Dio();
//     dio.options.headers['content-Type'] = "application/json";
//     return await dio.get(url,
//         options: Options(responseType: ResponseType.json, method: 'GET'));
//   }
// }
