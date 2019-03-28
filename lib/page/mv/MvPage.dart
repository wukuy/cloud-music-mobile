import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/NetworkMiddleware.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';

class MvPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => _MvpageState();
}

class _MvpageState extends State<MvPage>{
  NetworkMiddleware networkMiddleware;
  @override
  void initState() {
    super.initState();
    networkMiddleware = NetworkMiddleware(req: getSongDetail,);
     
    if(mounted) {
      // getSongDetail();
    }
  }
  getSongDetail() async {
    var data = await FindDao.getSongDetail({"id": 2706035001});
    
    return data;
  }
  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: <Widget>[
            FlatButton(
              child: Text('请求数据'),
              onPressed: () async {
                
              },
            ),
            networkMiddleware
          ],
        ),
      );
    }
    
}