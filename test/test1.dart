import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my app",
      home: Scaffold(
        appBar: AppBar(title: Text('app'),),
      ),
    );
  }
}
