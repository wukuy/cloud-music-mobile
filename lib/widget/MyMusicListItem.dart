import 'package:flutter/material.dart';

class MyMusicListItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  MyMusicListItem({this.title, this.icon, this.onTap});

  @override
  State<StatefulWidget> createState() => _MyMusicListItem();
}

class _MyMusicListItem extends State<MyMusicListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      leading: Icon(widget.icon),
      onTap: widget.onTap,
    );
  }
}
