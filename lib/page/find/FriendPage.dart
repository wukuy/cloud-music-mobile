import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';

class FriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FriendPageState();
}

class _FriendPageState extends State with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
//   highlightColor: Colors.red,
      splashColor: Colors.greenAccent,
      onTap: () {
      },
      child: Container(
        width: 120.0,
        height: 40.0,
        child: new Center(
          child: new Text("测试水波纹"),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
