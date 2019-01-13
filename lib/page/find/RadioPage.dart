import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => _RadioPageState();
}

class _RadioPageState extends State  with AutomaticKeepAliveClientMixin{
  @override
    Widget build(BuildContext context) {
      return Text('电台');
    }
    @override
      bool get wantKeepAlive => true;
}