import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:cloud_music_mobile/common/redux/PlayerState.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'dart:ui';
import 'package:cloud_music_mobile/models/SongDetail.dart';
import 'package:cloud_music_mobile/models/Song.dart';

class SongDetailPage extends StatefulWidget {
  final String title;
  final int songSheetId;
  final String authorName;
  final String coverPic;
  SongDetailPage(
      {this.title, this.songSheetId, this.authorName, this.coverPic});

  @override
  State<StatefulWidget> createState() => _SongDetailPage();
}

class _SongDetailPage extends State<SongDetailPage> {
  List<Song> list;
  SongDetail info;
  Map describe;
  int count = 0;

  @override
  void initState() {
    super.initState();
    _getSongDetail();
  }

  _getSongDetail() async {
    Map data = await FindDao.getSongDetail({"id": widget.songSheetId});
    setState(() {
      list = data["playlist"];
      info = data["info"];
      count = list.length + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBlur(
        Scaffold(
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
                return SongDescribe(
                    coverPic: widget.coverPic,
                    name: widget.authorName,
                    data: info);
              } else {
                Song item = list[idx-1];
                SongListItem songListItem = SongListItem(
                    list: list,
                    songName: item.songName,
                    songId: item.songId,
                    singer: item.singer,
                    coverPic: item.coverPic,
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
        ),
        coverPic: widget.coverPic);
  }
}

class BackgroundBlur extends StatelessWidget {
  final Widget child;
  final String coverPic;
  BackgroundBlur(this.child, {this.coverPic});

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
                    coverPic,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: IgnorePointer(
                  ignoring: true,
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 100, sigmaY: 100),
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

class SongDescribe extends StatelessWidget {
  final String coverPic;
  final String name;
  final SongDetail data;
  SongDescribe({this.coverPic, this.name, this.data});

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
                    coverPic,
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
                          name,
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
                                    image: NetworkImage(data.avatarUrl ?? ''),
                                  ),
                                ),
                              ),
                              Text(
                                data.nickname ?? '',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          _menu(data)
        ],
      ),
    );
  }

  _menu(SongDetail data) {
    int commentCount = data.commentCount;
    int shareCount = data.shareCount;
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
  final int songId;
  final String singer;
  final int index;
  final String coverPic;

  SongListItem(
      {this.songName,
      this.songId,
      this.singer,
      this.index,
      this.coverPic,
      this.list});

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
                        widget.singer,
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
    Map result = await FindDao.getSongUrl({'id': widget.songId});
    if (result != null) {
      store.dispatch(PlayInfoState(widget.songId, widget.list, url: result["url"]));

      store.dispatch(PlayerState(PlayActions.play));
    }
  }
}
