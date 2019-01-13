import 'package:dio/dio.dart';
import 'package:cloud_music_mobile/common/dao/EventDao.dart';

class Http {
  Dio dio;
  
  Http({bool loading: true}) {
    dio = Dio();
    setConfig();
    setInterceptor(loading: loading);
  }

  request(String path, { Map data, Options options}) {
    return dio.request(path, data: data, options: options);
  }

  Future<Response> get(String path, {Map data, Options options}) {
    return dio.get(path, data: data, options: options);
  }

  static all(list, {loading = false}) async{
    var results;
    if(loading) Loading.show();

    try {
      results = await Future.wait(list);
    } catch (e) {
      results = null;
    }

    if(loading) Loading.hide();
    return results;
  }

  setConfig() {
    dio.options.baseUrl="http://api.music.wukuy.cn";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
  }

  setInterceptor({bool loading}) {
    dio.interceptor.request.onSend = (Options options) {
      if(loading) Loading.show();
      return options;
    };
    dio.interceptor.response.onSuccess = (Response response) {
      if(loading) Loading.hide();
      return response;
    };
    dio.interceptor.response.onError = (DioError e) {
      if(loading) Loading.hide();
      return e;
    };
  }
}
