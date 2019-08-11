import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/NetworkMiddleware.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';

class MvPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MvpageState();
}

class _MvpageState extends State<MvPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[Text('视频')],
      ),
    );
  }
}
