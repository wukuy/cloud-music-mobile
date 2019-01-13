import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/MyMusicListItem.dart';

class MyMusicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyMusicState();
}

class _MyMusicState extends State with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        InfoCard(),
        MyMusicListItem(title: '本地音乐', icon: Icons.music_note, onTap: () {}),
        MyMusicListItem(title: '最近播放', icon: Icons.music_note, onTap: () {}),
        MyMusicListItem(title: '下载管理', icon: Icons.music_note, onTap: () {}),
        MyMusicListItem(title: '我的电台', icon: Icons.music_note, onTap: () {}),
        MyMusicListItem(title: '我的收藏', icon: Icons.music_note, onTap: () {}),
        MyMusicListItem(title: 'Sati空间', icon: Icons.music_note, onTap: () {}),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// 用户信息卡片
class InfoCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfoCard();
}

class _InfoCard extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0xffdd4137),
            height: 70,
          ),
          Positioned(
            child: Container(
              height: 150,
              margin: EdgeInsets.only(left: 6, right: 6, top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(new Radius.circular(8)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color(0xffcccccc),
                    offset: Offset(0, 4),
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Row(
                children: <Widget>[Expanded(child: Text('宇鱼鱼'))],
              ),
            ),
          )
        ],
      ),
    );
  }
}
