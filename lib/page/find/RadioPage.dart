import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';
import 'package:cloud_music_mobile/page/find/SongDetailPage.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/widget/SwiperAndMenu.dart';
import 'package:cloud_music_mobile/models/Recommend.dart';
import 'package:cloud_music_mobile/models/FindBanner.dart';

class RadioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RadioPageState();
}

class _RadioPageState extends State with AutomaticKeepAliveClientMixin {
  List<Banners> _bannerData = [];
  List<Result> _songSheet = [];
  List<Result> _newsong = [];
  List<Result> _djprogram = [];
  final List<MenuItem> _menus = [
    MenuItem(icon: Icons.radio, text: '私人FM'),
    MenuItem(icon: Icons.date_range, text: '内容推荐'),
    MenuItem(icon: Icons.queue_music, text: '歌单'),
    MenuItem(icon: Icons.donut_large, text: '排行榜'),
  ];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    showRefresh();
  }

  getData() async {
    Map data = await FindDao.getFindPageData();
    if (data != null && mounted) {
      setState(() {
        _bannerData = data['banner'];
        _songSheet = data['songSheet'];
        _newsong = data['newsong'];
        _djprogram = data['djprogram'];
      });
    }
  }

  ///显示刷新
  showRefresh() {
    Future.delayed(Duration(seconds: 0), () {
      _refreshIndicatorKey.currentState.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      color: Colors.red,
      child: CustomScrollView(
        cacheExtent: 2000,
        slivers: <Widget>[
          SwiperAndMenu(
            bannerData: _bannerData,
            menus: _menus,
          ),
          BoxTitle(title: '推荐歌单', onTap: () {}),
          BoxContent(list: _songSheet, title: '歌单'),
          BoxTitle(title: '最新音乐', onTap: () {}),
          BoxContent(list: _newsong, title: '最新音乐'),
          BoxTitle(title: '主播电台', onTap: () {}),
          BoxContent(list: _djprogram, title: '主播电台')
        ],
      ),
      onRefresh: () async {
        await getData();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BoxContent extends StatelessWidget {
  final Function api;
  final String title;
  final List list;
  BoxContent({this.api, this.title, this.list});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 5, right: 5),
      sliver: SliverGrid(
        //Grid
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 6 / 8,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 3,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {

            return InkWell(
              child: Column(
                children: <Widget>[
                  Img(
                    list.length > 0 ? list[index].picUrl : '',
                    width: 126,
                    height: 120,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      list.length > 0 ? list[index].name : "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff333333),
                      ),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SongDetailPage(
                          title: title,
                          songSheetId: list[index].id,
                          authorName: list[index].name,
                          coverPic: list[index].picUrl);
                    },
                  ),
                );
              },
            );
          },
          childCount: 6,
        ),
      ),
    );
  }
}

class BoxTitle extends StatelessWidget {
  final Function onTap;
  final String title;
  BoxTitle({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
            padding: EdgeInsets.only(top: 5),
            child: FlatButton(
              onPressed: onTap,
              child: Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff333333),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  )
                ],
              ),
            )),
      ]),
    );
  }
}
