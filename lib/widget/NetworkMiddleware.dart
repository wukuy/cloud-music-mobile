import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_music_mobile/common/Http.dart';
import 'package:dio/dio.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';

enum SpinkitType { Wave }
enum NetworkState { success, fail, loading }

class NetworkMiddleware extends StatefulWidget {
  final String loadText;
  final SpinkitType spinkitType;
  final Widget placeholder;
  final EdgeInsets margin;
  final Colors color;
  final Colors background;
  final Widget child;
  final Function req;

  NetworkMiddleware(
      {this.loadText: '努力加载中...',
      this.color,
      this.background,
      this.spinkitType,
      this.placeholder,
      this.child,
      this.margin,
      @required this.req});

  @override
  State<StatefulWidget> createState() {
    return _NetworkMiddleware();
  }
}

class _NetworkMiddleware extends State<NetworkMiddleware> {
  NetworkState state = NetworkState.loading;
  DioErrorType errorType;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.background ?? Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[_setPlaceholder()],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if(mounted) {
      _req();
    }
  }

  _setPlaceholder() {
    return widget.placeholder ??
        Container(
            margin: widget.margin ?? EdgeInsets.only(top: 28, bottom: 28),
            child: Column(
              children: <Widget>[
                _setContent()
              ],
            ));
  }

  _setContent() {
    Widget widget;
    switch (state) {
      case NetworkState.fail:
        widget = _fail(errorType);
        break;
      case NetworkState.loading:
        widget = _loading();
        break;
      case NetworkState.success:
        widget = _success();
        break;
    }

    return widget;
  }

  _loading() {
    return Row(children: <Widget>[
      SpinKitWave(
        color: widget.color ?? Colors.black26,
        type: SpinKitWaveType.start,
        size: 14,
      ),
      Container(
        margin: EdgeInsets.only(left: 6),
        child: Text(widget.loadText,
            style: TextStyle(color: widget.color ?? Colors.black45)),
      )
    ]);
  }

  _success() {
    return widget.child ?? Text("请求成功");
  }

  _fail(errorType) {
    String text = '';

    switch (errorType) {
      // 网络错误，Default error type, usually occurs before connecting the server.
      case DioErrorType.DEFAULT:
        text = '请连接网络后点击屏幕';
        break;
      // 连接超时
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
        text = '加载失败，请点击重试';
        break;
    }
    return InkWell(
      onTap: () {
        _req();
      },
      child: Text(text),
    );
  }

  _req() async {
    var result;

    if (mounted) {
      setState(() {
        state = NetworkState.loading;
      });
    }

    try {
      result = await widget.req();
    } catch (e) {
      errorType = e.type;
      setState(() {
        state = NetworkState.fail;
      });
      rethrow;
    }

    
    if (result != null) {
      setState(() {
        state = NetworkState.success;
      });
      return result;
    }
  }
}
