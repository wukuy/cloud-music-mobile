import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          // elevation: 0,
        ),
        body: ListView.builder(
          itemCount: count,
          itemBuilder: (context, idx) {
            if (idx == 0) {
              return SongDescribe(data: describe);
            } else {
              Map item = list[idx - 1];
              return SongListItem(
                  songName: item["name"],
                  id: item["id"],
                  singerName: item["ar"][0]["name"],
                  index: idx);
            }
          },
        ));
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
      color: Colors.grey,
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.data["coverImgUrl"]),
                    ),
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
  final String songName;
  final int id;
  final String singerName;
  final int index;
  SongListItem({this.songName, this.id, this.singerName, this.index});

  @override
  State<StatefulWidget> createState() => _SongListItem();
}

class _SongListItem extends State<SongListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            print('点击');
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
        ));
  }
}
