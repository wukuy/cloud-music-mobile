import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/HomeDrawer.dart';
import 'package:cloud_music_mobile/page/FindMusicPage.dart';
import 'package:cloud_music_mobile/page/MyMusicPage.dart';
import 'package:cloud_music_mobile/page/Mvpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<TabItem> _tabs = <TabItem>[
    TabItem(
        tab: Tab(
          child: Image.asset('lib/assets/image/t_actionbar_music_selected.png'),
        ),
        page: MyMusicPage()),
    TabItem(
        tab: Tab(
          child:
              Image.asset('lib/assets/image/t_actionbar_discover_normal.png'),
        ),
        page: FindMusicPage()),
    TabItem(
        tab: Tab(
          child: Image.asset('lib/assets/image/t_actionbar_video_normal.png'),
        ),
        page: Mvpage()),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TabBar(
            controller: _tabController,
            tabs: _tabs.map((item) => item.tab).toList(),
            indicatorWeight: 0.1,
            // isScrollable: true,
            // labelPadding: EdgeInsets.only(left: 5, right: 5),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((item) => item.page).toList(),
      ),
      drawer: HomeDrawer(),
    );
  }
}

class TabItem {
  Tab tab;
  Widget page;
  String text;

  TabItem({this.tab, this.page, this.text});
}
