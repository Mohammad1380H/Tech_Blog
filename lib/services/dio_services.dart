import 'package:dio/dio.dart';

class DioServices {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = "application/json";
    var response = await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .catchError((error) {
      if (error is DioError) {
        return error.response!;
      }
    });
    return response;
  }

  Future<dynamic> postMethod(String url, Map<String, dynamic> map) async {
    dio.options.headers['content-Type'] = "application/json";
    //TODO : Read token from storage
    var response = await dio.post(url,
        options: Options(responseType: ResponseType.json, method: 'POST'),
        data: FormData.fromMap(map));
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
