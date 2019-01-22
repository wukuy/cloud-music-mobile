import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:cloud_music_mobile/common/redux/PlayerState.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'dart:ui';

class SongDetailPage extends StatefulWidget {
  final String title;
  final int id;
  SongDetailPage({this.title, this.id});

  @override
  State<StatefulWidget> createState() => _SongDetailPage();
}

class _SongDetailPage extends State<SongDetailPage> {
  List list = [];
  int count = 0;
  Map describe;

  @override
  void initState() {
    super.initState();
    _getSongDetail();
  }

  _getSongDetail() async {
    var data = await FindDao.getSongDetail({"id": widget.id});
    setState(() {
      describe = data["playlist"];
      list = data["playlist"]["tracks"];
      count = list.length + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBlur(Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (context, idx) {
          if (idx == 0) {
            return SongDescribe(data: describe);
          } else {
            Map item = list[idx - 1];
            SongListItem songListItem = SongListItem(
                list: list,
                songName: item["name"],
                id: item["id"],
                singerName: item["ar"][0]["name"],
                coverPic: item["al"]["picUrl"],
                index: idx);

            if (idx == 1) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: songListItem,
              );
            } else {
              return Container(
                color: Colors.white,
                child: songListItem,
              );
            }
          }
        },
      ),
    ), data: describe);
  }
}

class BackgroundBlur extends StatelessWidget {
  final Widget child;
  final Map data;
  BackgroundBlur(this.child, {this.data});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, Store<AppState> store) {
        return Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Img(
                    data == null ? '' : data['coverImgUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: IgnorePointer(
                  ignoring: true,
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: child,
              )
            ],
          ),
        );
      },
    );
  }
}

class SongDescribe extends StatefulWidget {
  final Map data;
  SongDescribe({this.data});

  @override
  State<StatefulWidget> createState() => _SongDescribe();
}

class _SongDescribe extends State<SongDescribe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      // color: Colors.grey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 120,
                  width: 120,
                  child: Img(
                    widget.data["coverImgUrl"],
                    fit: BoxFit.fill,
                    radius: 4,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.data["name"],
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 26,
                                  height: 26,
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(widget
                                              .data["creator"]["avatarUrl"]))),
                                ),
                                Text(
                                  widget.data["creator"]["nickname"],
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          _menu()
        ],
      ),
    );
  }

  _menu() {
    int commentCount = widget.data["commentCount"];
    int shareCount = widget.data["shareCount"];
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          _menuItem("$commentCount", Icons.comment),
          _menuItem("$shareCount", Icons.share),
          _menuItem("下载", Icons.arrow_downward),
          _menuItem("多选", Icons.check_box)
        ],
      ),
    );
  }

  _menuItem(String text, IconData icon) {
    return Expanded(
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class SongListItem extends StatefulWidget {
  final List list;
  final String songName;
  final int id;
  final String singerName;
  final int index;
  final String coverPic;
  SongListItem(
      {this.songName, this.id, this.singerName, this.index, this.coverPic, this.list});

  @override
  State<StatefulWidget> createState() => _SongListItem();
}

class _SongListItem extends State<SongListItem> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, Store<AppState> store) {
        return InkWell(
          onTap: () {
            _getSongUrl(store);
          },
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.index}",
                    style: TextStyle(fontSize: 12, color: Color(0xff666666)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.songName,
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        widget.singerName,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.play_circle_outline),
                    Icon(Icons.more_vert),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _getSongUrl(Store store) async {
    var result = await FindDao.getSongUrl({'id': widget.id});
    if (result != null) {
      store.dispatch(
        PlayInfoState(
            url: result['url'],
            songName: widget.songName,
            singer: widget.singerName,
            coverPic: widget.coverPic,
            songList: widget.list),
            songId: id
      );

      store.dispatch(PlayerState(PlayActions.play));
    }
  }
}
