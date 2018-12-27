import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Item 1'),
            leading: new CircleAvatar(
              child: new Icon(Icons.school),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
