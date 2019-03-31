import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/page/login/LoginMainPage.dart';
import 'package:cloud_music_mobile/widget/ListItemCustom.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_music_mobile/models/UserInfo.dart';
import 'dart:convert';
import 'package:cloud_music_mobile/widget/Img.dart';

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
          DrawerListItem(text: "我的消息", iconData: Icons.email, onTap: () {}),
          DrawerListItem(
              text: "会员中心", iconData: Icons.favorite_border, onTap: () {}),
          DrawerListItem(text: "商城", iconData: Icons.email, onTap: () {}),
          DrawerListItem(text: "在线听歌免流量", iconData: Icons.email, onTap: () {}),
          Container(color: Color(0xfff5f5f5), height: 8),
          DrawerListItem(text: "我的好友", iconData: Icons.email, onTap: () {}),
          DrawerListItem(text: "附近的人", iconData: Icons.email, onTap: () {}),
          Container(color: Color(0xfff5f5f5), height: 8),
          DrawerListItem(text: "个性皮肤", iconData: Icons.email, onTap: () {}),
          DrawerListItem(text: "听歌识曲", iconData: Icons.email, onTap: () {}),
          DrawerListItem(text: "定时停止播放", iconData: Icons.email, onTap: () {}),
          DrawerListItem(text: "扫一扫", iconData: Icons.email, onTap: () {}),
          DrawerListItem(
            text: "退出登录",
            iconData: Icons.exit_to_app,
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.remove(('userInfo'));
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return LoginMainPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  final String text;
  final Function onTap;
  final IconData iconData;
  DrawerListItem({this.text, this.onTap, this.iconData});

  @override
  Widget build(BuildContext context) {
    return ListItemCustom(
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.black38,
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(text),
        ),
      ],
      onTap: onTap,
      divider: false,
    );
  }
}

// 用户头像
class UserHead extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserHead();
}

class _UserHead extends State {
  UserInfo userInfo;

  @override
  void initState() {
    super.initState();
    _getLocalUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: userInfo == null
                ? AssetImage('lib/assets/image/bg.jpg')
                : NetworkImage(userInfo.backgroundUrl)),
      ),
      child: userInfo != null ? _login() : _unlogin(),
    );
  }

  _getLocalUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userInfoStr = pref.getString('userInfo');

    if (userInfoStr != null) {
      setState(() {
        userInfo = UserInfo.fromJson(jsonDecode(userInfoStr));
      });
    }
  }

  // 已登录
  _login() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          child: Img(userInfo.avatarUrl, width: 60, height: 60, radius: 30),
          onTap: () {},
        ),
        Container(
            padding: EdgeInsets.only(top: 14, bottom: 14),
            child: Row(
              children: <Widget>[
                Text(
                  userInfo.nickname,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                // InkWell(
                //   child: Text(
                //     'Lv.5',
                //     style: TextStyle(
                //       fontSize: 12,
                //       color: Colors.white,
                //     ),
                //   ),
                // )
              ],
            ))
      ],
    );
  }

  // 未登录
  _unlogin() {
    return Container(
        child: Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              '登录网易云音乐',
              style: TextStyle(color: Colors.white),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              '手机电脑多端同步,尽享海量品质音乐',
              style: TextStyle(color: Colors.white),
            )
          ]),
          Container(
            margin: EdgeInsets.only(top: 14),
            child: OutlineButton(
              padding: EdgeInsets.only(left: 45, right: 46),
              child: Text(
                "立即登录",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return LoginMainPage();
                }));
              },
              borderSide: BorderSide(color: Colors.white.withOpacity(0.4)),
            ),
          )
        ],
      ),
    ));
  }
}
