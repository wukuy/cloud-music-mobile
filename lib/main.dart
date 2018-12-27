import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/page/HomePage.dart';

void main() => runApp(CloudMusic());

class CloudMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cloud music',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Color(0xffdd4137)
      ),
      home: HomePage(),
    );
  }
}

