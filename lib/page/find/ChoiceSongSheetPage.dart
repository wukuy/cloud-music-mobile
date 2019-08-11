/*
 * @Descripttion: 歌单广场
 * @version: 
 * @Author: 웃□宇♂
 * @Date: 2019-08-10 21:41:08
 * @LastEditors: 웃□宇♂
 * @LastEditTime: 2019-08-11 14:44:24
 */

import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/widget/BackgroundBlur.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cloud_music_mobile/widget/SongSheetGridView.dart';
import 'package:cloud_music_mobile/widget/PlayCount.dart';
import 'package:cloud_music_mobile/widget/RoundBottomSheet.dart';
import 'package:cloud_music_mobile/page/find/SongSheetTagPage.dart';

class ChoiceSongSheetPage extends StatelessWidget {
  List<Choice> choices;
  @override
  Widget build(BuildContext context) {
    List list = [
      {'name': '推荐'},
      {'name': '精品'},
      {'name': '华语'},
      {'name': '流行'},
      {'name': '民谣'},
      {'name': '欧美'},
      {'name': '精品'},
      {'name': '华语'},
      {'name': '流行'},
      {'name': '民谣'},
      {'name': '欧美'},
    ];
    choices = <Choice>[
      Choice(name: '推荐', tabView: Recommend()),
      Choice(name: '精品', tabView: ExcellentSongSheet(list)),
      Choice(name: '华语', tabView: SongSheetClass()),
      Choice(name: '流行', tabView: SongSheetClass()),
      Choice(name: '民谣', tabView: SongSheetClass()),
      Choice(name: '欧美', tabView: SongSheetClass()),
      Choice(name: '精品', tabView: SongSheetClass()),
      Choice(name: '华语', tabView: SongSheetClass()),
      Choice(name: '流行', tabView: SongSheetClass()),
      Choice(name: '民谣', tabView: SongSheetClass()),
      Choice(name: '欧美', tabView: SongSheetClass()),
    ];

    return DefaultTabController(
      child: BackgroundBlur(
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
            body: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: TabBar(
                          tabs: choices.map((Choice choice) {
                            return Tab(
                              text: choice.name,
                            );
                          }).toList(),
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
                        icon: Icon(Icons.flip_to_front),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SongSheetTagPage()));
                        })
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
            )),
        coverPic:
            'http://p2.music.126.net/LiuIyh9du-WOk45hhR01IQ==/109951163464139769.jpg',
      ),
      initialIndex: 0,
      length: choices.length,
    );
  }
}

class Choice {
  String name;
  Widget tabView;
  Choice({@required this.name, this.tabView});
}

// 推荐选项卡
class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        Banner(),
        SongSheetGridView(),
      ],
    );
  }
}

// 精品歌单
class ExcellentSongSheet extends StatelessWidget {
  final List choices;
  ExcellentSongSheet(this.choices);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                      '全部',
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
                          SongSheetClassBottomSheet.show(context, choices);
                        },
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
        SongSheetGridView()
      ],
    );
  }
}

class SongSheetClassBottomSheet {
  static show(context, List choices) {
    return RoundBottomSheet.show(context,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 24, top: 24),
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
                      '全部歌单',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
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
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int idx) {
                    return FlatButton(
                      child: Text(
                        choices[idx]['name'],
                        style: TextStyle(fontSize: 12),
                      ),
                      color: Color(0xfff3f3f3),
                      shape: StadiumBorder(),
                      onPressed: () {},
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.device_unknown,
                    color: Color(0xff969696),
                    size: 14,
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
            ],
          ),
        ));
  }
}

// 歌单分类
class SongSheetClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(top: 22),
          sliver: SongSheetGridView(),
        ),
      ],
    );
  }
}

// 轮播图
class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      // height: 252,
      padding: EdgeInsets.only(top: 22, bottom: 22, left: 0, right: 0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Container(
            height: 252,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Img(
                                "http://via.placeholder.com/288x188",
                                radius: 0,
                              ),
                              Positioned(
                                right: 7,
                                top: 7,
                                child: PlayCount(),
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
                            '听完这些歌，恭喜你获得孤独和解的能力。',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 10,
              viewportFraction: 0.6,
              scale: 0.8,
            ),
          )
        ]),
      ),
    );
  }
}
