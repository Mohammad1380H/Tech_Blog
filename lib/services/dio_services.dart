import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tech_bloc/component/my_strings.dart';

class DioServices {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = "application/json";
    var response = await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        // ignore: body_might_complete_normally_catch_error
        .catchError((error) {
      if (error is DioError) {
        log(error.toString());
        return error.response!;
      }
    });
    return response;
  }


Future<String> downloadImage(String url) async {
  Dio dio = Dio();
  Response response = await dio.get(url, options: Options(responseType: ResponseType.bytes));
  String fileName = url.substring(url.lastIndexOf("/") + 1);
  File file = File("${(await getTemporaryDirectory()).path}/$fileName");
  await file.writeAsBytes(response.data);
  return file.path;
}

  Future<dynamic> postMethod(String url, Map<String, dynamic> map) async {
    var token = GetStorage().read(FromStrings.token);

    dio.options.headers['content-Type'] = "application/json";
    if (token != null) {
      dio.options.headers['authorization'] = token;
    }
    var response = await dio
        .post(url,
            options: Options(responseType: ResponseType.plain, method: 'POST'),
            data: FormData.fromMap(map))
        // ignore: body_might_complete_normally_catch_error
        .catchError((err) {
      log(err.toString());
    });
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
