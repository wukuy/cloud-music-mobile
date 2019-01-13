import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => _FriendPageState();
}

class _FriendPageState extends State with AutomaticKeepAliveClientMixin{
  @override
    Widget build(BuildContext context) {
      return Text('朋友');
    }
    @override
      bool get wantKeepAlive => true;
}