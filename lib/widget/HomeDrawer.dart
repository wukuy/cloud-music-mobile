import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/common/dao/EventDao.dart';

class HomeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserHead(),
          ListItem(title: '我的消息', icon: Icons.message, onTap: () {Loading.hide();}),
          ListItem(title: '会员中心', icon: Icons.message, onTap: () {Loading.show();}),
          ListItem(title: '商城', icon: Icons.message, onTap: () {}),
          ListItem(title: '在线听歌免流量', icon: Icons.message, onTap: () {}),
          Container(
            color: Color(0xfff5f5f5),
            height: 8,
          ),
          ListItem(title: '我的好友', icon: Icons.message, onTap: () {}),
          ListItem(title: '附近的人', icon: Icons.message, onTap: () {}),
          Container(
            color: Color(0xfff5f5f5),
            height: 8,
          ),
          ListItem(title: '个性皮肤', icon: Icons.message, onTap: () {}),
          ListItem(title: '听歌识曲', icon: Icons.message, onTap: () {}),
          ListItem(title: '定时停止播放', icon: Icons.message, onTap: () {}),
          ListItem(title: '扫一扫', icon: Icons.message, onTap: () {}),
        ],
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  ListItem({this.title, this.icon, this.onTap});

  @override
  State<StatefulWidget> createState() => _ListItem();
}

class _ListItem extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 16, right: 16,),
      title: Text(widget.title),
      leading: Icon(widget.icon),
      onTap: widget.onTap,
    );
  }
}

// 用户头像
class UserHead extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserHead();
}

class _UserHead extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('lib/assets/image/bg.jpg')),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('lib/assets/image/head_pic.jpeg'),
          ),
          Container(
              padding: EdgeInsets.only(top: 14, bottom: 14),
              child: Row(
                children: <Widget>[
                  Text(
                    '小玉玉',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Text(
                      'Lv.5',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
