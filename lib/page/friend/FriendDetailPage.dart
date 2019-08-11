import 'package:flutter/material.dart';

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
