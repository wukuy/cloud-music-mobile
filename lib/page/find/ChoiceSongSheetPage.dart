/*
 * @Descripttion: 歌单广场
 * @version: 
 * @Author: 웃□宇♂
 * @Date: 2019-08-10 21:41:08
 * @LastEditors: 웃□宇♂
 * @LastEditTime: 2019-08-18 14:23:12
 */

import 'package:cloud_music_mobile/widget/NetworkMiddleware.dart';
import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/widget/BackgroundBlur.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cloud_music_mobile/widget/SongSheetGridView.dart';
import 'package:cloud_music_mobile/widget/PlayCount.dart';
import 'package:cloud_music_mobile/widget/RoundBottomSheet.dart';
import 'package:cloud_music_mobile/page/find/SongSheetTagPage.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';
import 'package:cloud_music_mobile/models/SongSheetCategorys.dart';
import 'package:cloud_music_mobile/models/ExcellentSheetSong.dart';
import 'package:cloud_music_mobile/models/HotSongSheetCategorys.dart';
import 'package:cloud_music_mobile/models/Recommend.dart';
import 'package:cloud_music_mobile/page/find/SongDetailPage.dart';
import 'package:cloud_music_mobile/widget/Loading.dart';

class ChoiceSongSheetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChoiceSongSheetPageState();
  }
}

class _ChoiceSongSheetPageState extends State<ChoiceSongSheetPage> {
  List<Choice> choices;
  HotSongSheetCategorys hotSongSheetCategorys;
  String backgroundImg;

  @override
  void initState() {
    super.initState();
    this._getData({'cat': ''});
  }

  _getData(data) async {
    await this._getHotSongSheetCategorys();

    choices = <Choice>[
      Choice(
        name: '推荐',
        tabView: RecommendSongSheet((_, url) {
          backgroundImg = url;
          setState(() {});
        }),
      ),
      Choice(
        name: '精品',
        tabView: ExcellentSongSheet(),
      ),
    ];

    hotSongSheetCategorys.tags.forEach((item) {
      choices.add(
        Choice(
          name: item.name,
          tabView: SongSheetClass(item.name),
        ),
      );
    });

    this.setState(() {});
  }

  _getHotSongSheetCategorys() async {
    hotSongSheetCategorys = await FindDao.getHotSongSheetCategorys();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBlur(
      maskColor: Colors.white.withOpacity(0.8),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('歌单广场'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black26),
          iconTheme: IconThemeData(color: Color(0xff2b2b2c)),
          textTheme: TextTheme(
              title: TextStyle(
                  color: Color(0xff2b2b2c),
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          brightness: Brightness.light,
        ),
        body: choices == null
            ? Container()
            : DefaultTabController(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TabBar(
                              tabs: choices
                                  .map(
                                      (Choice choice) => Tab(text: choice.name))
                                  .toList(),
                              indicatorColor: Theme.of(context).primaryColor,
                              unselectedLabelColor: Color(0xff2b2b2c),
                              labelColor: Theme.of(context).primaryColor,
                              indicatorSize: TabBarIndicatorSize.label,
                              isScrollable: true,
                              labelPadding: EdgeInsets.only(
                                  left: 20, right: 20, top: 0, bottom: 0),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.dashboard,
                            color: Color(0xff666666),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SongSheetTagPage()));
                          },
                        )
                      ],
                    ),
                    Divider(
                      height: 1,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: choices.map((Choice choice) {
                          return choice.tabView;
                        }).toList(),
                      ),
                    )
                  ],
                ),
                initialIndex: 0,
                length: choices.length,
              ),
      ),
      coverPic: backgroundImg,
    );
  }
}

class Choice {
  String name;
  Widget tabView;
  Choice({@required this.name, this.tabView});
}

class RecommendSongSheet extends StatefulWidget {
  final Function onBannerIndexChanged;
  RecommendSongSheet(this.onBannerIndexChanged);
  @override
  State<StatefulWidget> createState() {
    return _RecommendSongSheet();
  }
}

// 推荐
class _RecommendSongSheet extends State<RecommendSongSheet>
    with AutomaticKeepAliveClientMixin {
  Recommend recommend;
  List<SheetSong> sheetSongs;
  @override
  void initState() {
    super.initState();
    this._getPersonalized();
  }

  _getPersonalized() async {
    recommend = await FindDao.getPersonalized();
    sheetSongs = recommend.result.map((item) {
      return SheetSong(
        id: item.id,
        coverImgUrl: item.picUrl,
        playCount: item.playCount,
        name: item.name,
      );
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: <Widget>[
        Banner(recommend, widget.onBannerIndexChanged),
        SongSheetGridView(sheetSongs),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
  @override
  void dispose() {
    super.dispose();
  }
}

// 精品歌单
class ExcellentSongSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExcellentSongSheetState();
  }
}

// 精品歌单
class ExcellentSongSheetState extends State<ExcellentSongSheet>
    with AutomaticKeepAliveClientMixin {
  String name;
  List<SheetSong> sheetSongs = [];
  SongSheetCategorys songSheetCategorys;
  ScrollController _scrollController = ScrollController();
  ExcellentSheetSong excellentSheetSong;
  bool isLoading = false;
  bool firstLoading = true;
  bool isLoadFinish = false;

  @override
  void initState() {
    super.initState();
    _getSongSheetCategorys();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore();
      }
    });

    _getExcellentSheetSong({'cat': name ?? '', 'limit': 15});
  }

  _getMore() {
    isLoadFinish = excellentSheetSong.lasttime == null;
    if (!isLoadFinish) {
      _getExcellentSheetSong(
        {
          'cat': name ?? '',
          'limit': 15,
          'before': excellentSheetSong.lasttime,
        },
      );
    }
  }

  _getExcellentSheetSong(data, {isReload = false}) async {
    if (!isLoading) {
      if (isReload) sheetSongs.clear();
      isLoading = true;

      excellentSheetSong = await FindDao.getExcellentSheetSong(data);
      excellentSheetSong.playlists.forEach((item) {
        sheetSongs.add(
          SheetSong(
            id: item.id,
            coverImgUrl: item.coverImgUrl,
            name: item.name,
            playCount: item.playCount.toDouble(),
          ),
        );
      });
      isLoading = false;
      firstLoading = false;
      if (mounted) this.setState(() {});
    }
  }

  _getSongSheetCategorys() async {
    List<Sub> sub = [];
    songSheetCategorys = await FindDao.getSongSheetCategorys();
    songSheetCategorys.sub.forEach((item) {
      if (item.hot) {
        sub.add(item);
      }
    });
    songSheetCategorys.sub = sub;
    if (mounted) this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(top: 22, left: 16, right: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      name == null ? '全部' : name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 60,
                      child: OutlineButton(
                        padding: EdgeInsets.zero,
                        highlightedBorderColor: Color(0xffaaaaaa),
                        borderSide:
                            BorderSide(width: 0.5, color: Color(0xffaaaaaa)),
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        shape: StadiumBorder(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.filter_list,
                              size: 12,
                            ),
                            Text(
                              '筛选',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          SongSheetClassBottomSheet.show(
                            context,
                            songSheetCategorys,
                            _callback,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              firstLoading ? Loading() : Container()
            ]),
          ),
        ),
        SongSheetGridView(sheetSongs),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
              [!firstLoading && !isLoadFinish ? Loading() : Container()]),
        )
      ],
    );
  }

  _callback(name) {
    if (name == '全部歌单' || name == '全部') {
      name = null;
    }
    this.name = name;
    this._getExcellentSheetSong({'cat': name ?? ''}, isReload: true);
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}

class SongSheetClassBottomSheet {
  static show(context, SongSheetCategorys songSheetCategorys, callback) {
    return RoundBottomSheet.show(
      context,
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 24),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 14),
              child: Text('选择你喜欢的分类', style: TextStyle(fontSize: 16)),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: FlatButton(
                shape: StadiumBorder(),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    songSheetCategorys.all.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  callback(songSheetCategorys.all.name);
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(top: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 10 / 4.5,
                    crossAxisCount: 4,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 20),
                itemCount: songSheetCategorys.sub.length,
                itemBuilder: (BuildContext context, int idx) {
                  return FlatButton(
                    child: Text(
                      songSheetCategorys.sub[idx].name,
                      style: TextStyle(fontSize: 12),
                    ),
                    color: Color(0xfff3f3f3),
                    shape: StadiumBorder(),
                    onPressed: () {
                      callback(songSheetCategorys.sub[idx].name);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.help_outline,
                    color: Color(0xff969696),
                    size: 18,
                  ),
                  Text(
                    '什么是精品歌单',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff969696),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  categoryTap(Sub category) {}
}

// 歌单分类
class SongSheetClass extends StatefulWidget {
  final String name;
  SongSheetClass(this.name);

  @override
  State<StatefulWidget> createState() {
    return SongSheetClassState();
  }
}

class SongSheetClassState extends State<SongSheetClass>
    with AutomaticKeepAliveClientMixin {
  List<SheetSong> sheetSongs = [];
  ScrollController _scrollController = ScrollController();
  ExcellentSheetSong excellentSheetSong;
  bool isLoding = false;
  int skipIndex = 0;
  int limit = 15;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore();
      }
    });
  }

  _initData() {
    return this
        ._getSheetSong({'cat': widget.name, 'limit': limit}, isReload: true);
  }

  _getMore() {
    if (excellentSheetSong.more) {
      print(skipIndex * limit);
      _getSheetSong(
          {'cat': widget.name, 'limit': limit, 'offset': skipIndex * limit});
    }
  }

  _getSheetSong(data, {isReload: false}) async {
    if (!isLoding) {
      excellentSheetSong = await FindDao.getSheetSong(data);
      if (isReload) sheetSongs.clear();
      excellentSheetSong.playlists.forEach((item) {
        sheetSongs.add(
          SheetSong(
            id: item.id,
            coverImgUrl: item.coverImgUrl,
            name: item.name,
            playCount: item.playCount.toDouble(),
          ),
        );
      });

      skipIndex++;

      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NetworkMiddleware(
      future: _initData,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(top: 22),
            sliver: SongSheetGridView(sheetSongs),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([Loading()]),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
  @override
  void dispose() {
    super.dispose();
  }
}

// 轮播图
class Banner extends StatelessWidget {
  final Recommend recommend;
  final Function onBannerIndexChanged;

  Banner(this.recommend, this.onBannerIndexChanged);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 22, bottom: 22, left: 0, right: 0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Container(
            height: 252,
            child: Swiper(
              onIndexChanged: (idx) {
                onBannerIndexChanged(idx, recommend.result[idx].picUrl);
              },
              itemBuilder: (BuildContext context, int index) {
                Result recommendItem;
                if (recommend?.result != null) {
                  recommendItem = recommend.result[index];
                }

                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SongDetailPage(
                            title: recommendItem.name,
                            songSheetId: recommendItem.id,
                            authorName: recommendItem.name,
                            coverPic: recommendItem.picUrl)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Img(
                                  recommendItem?.picUrl,
                                  radius: 0,
                                  width: 400,
                                  height: 400,
                                ),
                                Positioned(
                                  right: 7,
                                  top: 7,
                                  child: PlayCount(
                                      recommendItem?.playCount?.toDouble() ??
                                          0),
                                ),
                                Positioned(
                                  top: 7,
                                  left: 7,
                                  child: Text(
                                    'VIP',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Positioned(
                                    right: 7,
                                    bottom: 7,
                                    child: ClipOval(
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        color: Colors.white.withOpacity(0.85),
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Color(0xffff3a3a),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              recommendItem?.name ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 6,
              viewportFraction: 0.6,
              scale: 0.8,
            ),
          )
        ]),
      ),
    );
  }
}
