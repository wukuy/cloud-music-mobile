import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/page/RecommendPage.dart';
import 'package:cloud_music_mobile/page/FriendPage.dart';
import 'package:cloud_music_mobile/page/RadioPage.dart';

class FindMusicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FindMusicState();
}

class _FindMusicState extends State {
  final List<TabItem> _tabs = <TabItem>[
    TabItem(tab: Tab(text: '推荐'), page: RecommendPage()),
    TabItem(tab: Tab(text: '朋友'), page: FriendPage()),
    TabItem(tab: Tab(text: '电台'), page: RadioPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
              color: Color(0xffdd4137),
              child: TabBar(
                tabs: _tabs.map((item) => item.tab).toList(),
                indicatorColor: Colors.white,
                indicatorPadding: EdgeInsets.only(bottom: 10),
                indicatorSize: TabBarIndicatorSize.label,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: _tabs.map((item) => item.page).toList(),
            )
          )
        ],
      ),
    );
  }
}

class TabItem {
  Tab tab;
  Widget page;
  String text;

  TabItem({this.tab, this.page, this.text});
}
