import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/PlayBar.dart';

class SearchSongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchInput()),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
              child: ListView(
            children: <Widget>[HotSearch(), History()],
          )),
          PlayBar()
        ],
      ),
    );
  }
}

/// 搜索框
class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "出山 最近很火哦",
        hintStyle:
            TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 16),
        contentPadding: EdgeInsets.only(bottom: 8),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
      ),
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}

/// 热门搜索
class HotSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
      child: Wrap(
        spacing: 8.0,
        children: <Widget>[
          Row(children: <Widget>[
            Text('热门搜索',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black87))
          ]),
          Chip(
            label: Text('张艺兴远东韵律'),
          ),
          Chip(
            label: Text('有一种悲伤'),
          ),
          Chip(
            label: Text('起风了'),
          ),
          Chip(
            label: Text('绿色'),
          ),
          Chip(
            label: Text('只是太爱你'),
          )
        ],
      ),
    );
  }
}

/// 历史记录
class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
      child: Wrap(
        spacing: 8.0,
        children: <Widget>[
          Row(children: <Widget>[
            Text('历史记录',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black87))
          ]),
          Chip(
            label: Text('都是月亮惹的祸抖音'),
          ),
          Chip(
            label: Text('都是月亮惹的祸'),
          ),
          Chip(
            label: Text('求求你给我个机会'),
          ),
          Chip(
            label: Text('魔鬼中的天使'),
          ),
          Chip(
            label: Text('小新星'),
            
          ),
          Chip(
            label: Text('因为傻逼'),
          )
        ],
      ),
    );
  }
}
