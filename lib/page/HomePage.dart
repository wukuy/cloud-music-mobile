import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/HomeDrawer.dart';
import 'package:cloud_music_mobile/page/find/FindMusicPage.dart';
import 'package:cloud_music_mobile/page/my/MyMusicPage.dart';
import 'package:cloud_music_mobile/page/mv/Mvpage.dart';
import 'package:cloud_music_mobile/page/common/SearchSongPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<TabItem> _tabs = <TabItem>[
    TabItem(
      selected: Image.asset('lib/assets/image/t_actionbar_music_selected.png'),
      normal: Image.asset('lib/assets/image/t_actionbar_music_normal.png'),
      page: MyMusicPage(),
    ),
    TabItem(
      selected:
          Image.asset('lib/assets/image/t_actionbar_discover_selected.png'),
      normal: Image.asset('lib/assets/image/t_actionbar_discover_normal.png'),
      page: FindMusicPage(),
    ),
    TabItem(
      selected: Image.asset('lib/assets/image/t_actionbar_video_selected.png'),
      normal: Image.asset('lib/assets/image/t_actionbar_video_normal.png'),
      page: Mvpage(),
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
        title: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: TabBar(
            controller: _tabController,
            tabs: _tabs.map((item) {
              if (_tabs.indexOf(item) == _tabControllerIndex) {
                return Tab(child: item.selected);
              }
              return Tab(child: item.normal);
            }).toList(),
            indicatorWeight: 0.1,
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.only(left: 5, right: 5),
            // isScrollable: true,
            // labelPadding: EdgeInsets.only(left: 5, right: 5),
          ),
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
  Image selected;
  Image normal;
  Widget page;

  TabItem({this.selected, this.normal, this.page});
}
