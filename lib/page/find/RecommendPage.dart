import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';
import 'package:cloud_music_mobile/page/find/SongDetailPage.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/assets/ConstDefine.dart';
import 'package:cloud_music_mobile/assets/style/ColorDefine.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecommendPageState();
}

class _RecommendPageState extends State with AutomaticKeepAliveClientMixin {
  List _bannerData = [];
  List _songSheet = [];
  List _newsong = [];
  List _djprogram = [];
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
          SliverList(
            delegate: SliverChildListDelegate([
              Banner(_bannerData),
              Menu(),
              Divider(height: 1),
            ], addAutomaticKeepAlives: false, addRepaintBoundaries: false),
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

// 轮播图

class Banner extends StatelessWidget {
  List data = [];
  Banner(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[
          Positioned(
            // 使用row把背景宽度撑开
            child: Container(
              height: 110,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Color(0xffdd4137),
                    ),
                  )
                ],
              ),
            ),
          ),
          _swiper()
        ],
      ),
    );
  }

  _swiper() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          child:  Img(
            data.length > 0 ? data[index].imageUrl : ConstDefine.placeholderPic,
                  height: 120,
                  radius: 6,
                  fit: BoxFit.fitHeight,
                  color: Color(ColorDefine.placeholder),
                )

        );
      },
      itemCount: data.length == 0 ? 2 : data.length,
      pagination: SwiperPagination(),
      // control: SwiperControl(),
      scale: 0.99,
      autoplay: true,
    );
  }
}

// 私人Fm、每日推荐... 菜单。
class Menu extends StatelessWidget {
  final List<MenuItem> _menus = [
    MenuItem(icon: Icons.radio, text: '私人FM'),
    MenuItem(icon: Icons.date_range, text: '内容推荐'),
    MenuItem(icon: Icons.queue_music, text: '歌单'),
    MenuItem(icon: Icons.donut_large, text: '排行榜'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 12),
      child: Flex(
        direction: Axis.horizontal,
        children: _menus.map((item) {
          return Expanded(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            offset: Offset(1.0, 2.0),
                          ),
                        ]),
                    width: 50,
                    height: 50,
                    child: Icon(
                      item.icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      item.text,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  onTap: () {},
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MenuItem {
  IconData icon;
  String text;

  MenuItem({this.icon, this.text});
}

class BoxContent extends StatelessWidget {
  final Function api;
  final String title;
  List list = [];
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
                      return SongDetailPage(title: title, id: list[index].id);
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
