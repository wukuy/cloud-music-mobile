import 'package:flutter/material.dart';

class Mvpage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => _MvpageState();
}

class _MvpageState extends State with AutomaticKeepAliveClientMixin{
  @override
    Widget build(BuildContext context) {
      return Text('mv');
    }
    @override
      bool get wantKeepAlive => true;
}