import 'dart:async';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:cloud_music_mobile/common/dao/EventDao.dart';

class Http {
  Dio dio;
  static String cookie;
  bool returnData;

  Http({bool loading: true, returnData: true}) {
    dio = Dio();
    setConfig();
    setInterceptor(loading: loading);
  }

  static setCookie() {}

  request(String path, {Map data, Options options}) async {
    Response response = await dio.request(path, data: data, options: options);

    return response;
  }

  get(String path, {Map<String, dynamic> data, Options options}) async {
    Response response;
    try {
      response = await dio.get(path,
          queryParameters: data,
          options: Options(headers: {
            'Cookie':
                'MUSIC_U=331697943409e104ca0153d6516aef66bed4e5d1ad4623442883064268bdc0fcf6202122451b727414e0b3038c8ba2db63531a931aa80ad0; __remember_me=true; __csrf=9d9390af7162795cdd7fefb47816055b'
          }));
    } catch (e) {
      print(e);
      return null;
    }

    return response.data;
  }

  static all(List<Future> list, {bool loading = false}) async {
    if (loading) Loading.show();
    List results = await Future.wait(list);
    if (loading) Loading.hide();
    return results;
  }

  setConfig() {
    dio.options.baseUrl = "http://106.13.32.37:3000";
    dio.options.connectTimeout = 3000;
    dio.options.receiveTimeout = 5000;
  }

  setInterceptor({bool loading}) {
    // dio.interceptors.add(CookieManager(CookieJar()));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) {
      if (loading) Loading.show();
      print(options.cookies);
      return options;
    }, onResponse: (Response response) {
      if (loading) Loading.hide();
      return response;
    }, onError: (DioError e) {
      print(e);
      if (loading) Loading.hide();
      return e;
    }));
  }
}
