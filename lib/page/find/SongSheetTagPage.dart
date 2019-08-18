/*
 * @Descripttion: 歌单标签
 * @version: 
 * @Author: 웃□宇♂
 * @Date: 2019-08-11 14:10:13
 * @LastEditors: 웃□宇♂
 * @LastEditTime: 2019-08-17 12:03:39
 */

import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/NetworkMiddleware.dart';
import 'package:cloud_music_mobile/models/HotSongSheetCategorys.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';

class SongSheetTagPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SongSheetTagPageState();
  }
}

class SongSheetTagPageState extends State<SongSheetTagPage> {
  NetworkMiddleware networkMiddleware;
  @override
  void initState() {
    super.initState();
    networkMiddleware = NetworkMiddleware(
      future: _getHotSongSheetCategorys,
      child: Text('我是内容'),
    );
  }

  _getHotSongSheetCategorys() async {
    HotSongSheetCategorys hotSongSheetCategorys =
        await FindDao.getHotSongSheetCategorys();
    return hotSongSheetCategorys;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('歌单标签'),
      ),
      body: Column(
        children: <Widget>[
          Container(child: networkMiddleware),
          FlatButton(
            child: Text('获取数据'),
            onPressed: () {
              networkMiddleware.request();
            },
          )
        ],
      ),
    );
  }
}
