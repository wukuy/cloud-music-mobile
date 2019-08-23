import 'dart:async';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:cloud_music_mobile/common/dao/EventDao.dart';

class Http {
  Dio dio;
  static String cookie;
  bool returnData;
  Response response;

  Http({bool loading: true, returnData: true}) {
    dio = Dio();
    setConfig();
    setInterceptor(loading: loading);
  }

  static setCookie() {}

  request(String path, {Map data, Options options}) async {
    response = await dio.request(path, data: data, options: options);

    return response;
  }

  get(String path, {Map<String, dynamic> data, Options options}) async {
    print('cookie: $cookie');
    try {
      response = await dio.get(path,
          queryParameters: data, options: Options(headers: {'Cookie': cookie}));
    } catch (e) {
      print('netErr: $e');
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
      return options;
    }, onResponse: (Response response) {
      if (loading) Loading.hide();
      return response;
    }, onError: (DioError e) {
      if (loading) Loading.hide();
      return e;
    }));
  }
}
