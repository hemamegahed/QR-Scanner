import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl:'https://fourthpyramidagcy.net/company/api/v1/',
          receiveDataWhenStatusError: true,
          headers: {
            'Accept': 'application/json',
          }),
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String? token}) async {
    return await dio!.post(url, data: data);
  }
}
