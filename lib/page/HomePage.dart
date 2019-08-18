import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/HomeDrawer.dart';
import 'package:cloud_music_mobile/page/find/FindMusicPage.dart';
import 'package:cloud_music_mobile/page/my/MyMusicPage.dart';
import 'package:cloud_music_mobile/page/video/VideoPage.dart';
import 'package:cloud_music_mobile/page/common/SearchSongPage.dart';
import 'package:cloud_music_mobile/page/friend/FriendPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<TabItem> _tabs = <TabItem>[
    TabItem(
      text: '我的',
      page: MyMusicPage(),
    ),
    TabItem(
      text: '发现',
      page: FindMusicPage(),
    ),
    TabItem(
      text: '朋友',
      page: FriendPage(),
    ),
    TabItem(
      text: '视频',
      page: VideoPage(),
    ),
  ];

  TabController _tabController;
  int _tabControllerIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
    _tabController.index = _tabControllerIndex;
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _tabControllerIndex = _tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TabBar(
          controller: _tabController,
          tabs: _tabs.map((item) {
            return Tab(text: item.text);
          }).toList(),
          indicatorWeight: 0.1,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.only(left: 5, right: 5),
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 16),
          // isScrollable: true,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return SearchSongPage();
              }));
            },
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
  String text;
  Widget page;

  TabItem({@required this.text, @required this.page});
}
