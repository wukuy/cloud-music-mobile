import 'dart:async';
import 'package:dio/dio.dart';
import 'package:cloud_music_mobile/common/dao/EventDao.dart';

class Http {
  Dio dio;

  Http({bool loading: true}) {
    dio = Dio();
    setConfig();
    setInterceptor(loading: loading);
  }

  request(String path, {Map data, Options options}) async {
    Response request = await dio.request(path, data: data, options: options);

    return request;
  }

  get(String path, {Map data, Options options}) async {
    Response request =
        await dio.get(path, queryParameters: data, options: options);
    return request;
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
    dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) {
      if (loading) Loading.show();
      return options;
    }, onResponse: (Response response) {
      if (loading) Loading.hide();
      return response;
    }, onError: (DioError e) {
      if (loading) Loading.hide();
      // return e;
    }));
  }
}
