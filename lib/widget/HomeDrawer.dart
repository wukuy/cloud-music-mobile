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
          UserHead(),
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

class UserHead extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserHead();
}

class _UserHead extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545971258007&di=88754b8379f45671a31d5005d577ebdc&imgtype=0&src=http%3A%2F%2Fphotographs.leonardauction.com%2Fmax%2F189525.jpg',
                fit: BoxFit.cover,
              ),
            ],
          )
        ],
      ),
    );
  }
}
