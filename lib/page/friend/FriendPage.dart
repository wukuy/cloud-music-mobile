import 'dart:convert';
import 'package:cloud_music_mobile/models/VideoUrl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/models/UserEvent.dart';
import 'package:cloud_music_mobile/common/dao/FirendDao.dart';
import 'package:cloud_music_mobile/models/UserEventSong.dart';
import 'package:cloud_music_mobile/models/UserEventVideo.dart';
import 'package:cloud_music_mobile/common/Utils.dart';
import 'package:cloud_music_mobile/widget/VideoPlay.dart';
import 'package:cloud_music_mobile/common/dao/CommonDao.dart';

class FriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FriendPageState();
}

class _FriendPageState extends State with AutomaticKeepAliveClientMixin {
  UserEvent userEvent;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.white,
      child: ListView(
        children: userEvent != null
            ? userEvent.event.map((item) {
                return DynamicItem(item);
              }).toList()
            : [Container()],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getUserEvent();
  }

  getUserEvent() async {
    userEvent = await FirendDao.userEvent({'lasttime': ''});
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}

class DynamicItem extends StatelessWidget {
  final Event event;
  DynamicItem(this.event);

  @override
  Widget build(BuildContext context) {
    UserEventSong song;
    UserEventVideo video;

    Map json = jsonDecode(event.json);
    if (json['song'] != null) {
      song = UserEventSong.fromJson(json);
    } else {
      video = UserEventVideo.fromJson(json);
    }

    return Container(
      padding: EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffe6e6e6), width: 0.5))),
      child: Column(
        children: <Widget>[
          DynamicItemTop(event, isVideo: video != null),
          DynamicItemContent(
            song: song,
            video: video,
            event: event,
          ),
          DynamicItemBottom(event)
        ],
      ),
    );
  }
}

class DynamicItemTop extends StatelessWidget {
  final Event event;
  final bool isVideo;
  DynamicItemTop(this.event, {this.isVideo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // 头像
        Container(
          margin: EdgeInsets.only(right: 6),
          child: ClipOval(
            child: Image.network(event.user.avatarUrl,
                width: 36, height: 36, fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              event.user.nickname,
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff5078a6)),
                            ),
                            Text(
                              "${isVideo ? '发布视频' : '分享单曲'}:",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff616161)),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "${Utils.toTenThousand(event.user.followeds.toDouble())}粉丝",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff979797)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 22,
                    width: 55,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        '+ 关注',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      shape: StadiumBorder(),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DynamicItemContent extends StatefulWidget {
  final UserEventSong song;
  final UserEventVideo video;
  final Event event;

  DynamicItemContent(
      {@required this.song, @required this.video, @required this.event});

  @override
  State<StatefulWidget> createState() {
    return DynamicItemContentState();
  }
}

class DynamicItemContentState extends State<DynamicItemContent> {
  String url;

  @override
  void initState() {
    super.initState();

    _getVideoUrl();
  }

  _getVideoUrl() async {
    if (widget.video != null) {
      VideoUrl videoUrl =
          await CommonDao.getVideoUrl({'id': widget.video.video.videoId});
      url = videoUrl.urls[0].url;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      print(url);
    }
    return Container(
      margin: EdgeInsets.only(top: 10, left: 43, bottom: 18),
      child: widget.song != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.song?.msg ?? widget.video?.msg),
                Container(
                    margin: EdgeInsets.only(bottom: 7, top: 7),
                    child: Wrap(
                      direction: Axis.horizontal,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.event.pics.map((item) {
                        return Container(
                          margin: EdgeInsets.only(right: 4, bottom: 4),
                          child: Img(
                            item['originUrl'],
                            height: 101,
                            width: 101,
                            // width: 120,
                          ),
                        );
                      }).toList(),
                    )),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Color(0xfff3f3f3),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        child: Stack(
                          children: <Widget>[
                            Img(
                              widget.song.song.artists[0].picUrl,
                              width: 35,
                              height: 35,
                            ),
                            Positioned(
                              left: 8,
                              top: 8,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.white.withOpacity(0.8),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Color(0xffd33a32),
                                    size: 18,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.song.song.name),
                          Text(
                            widget.song.song.artists[0].name,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff6b6b6b),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          : Container(
              child: VideoPlay(url: url),
            ),
    );
  }
}

class DynamicItemBottom extends StatelessWidget {
  final Event event;
  DynamicItemBottom(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 43),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.share,
                  size: 12,
                  color: Color(0xff5d5d5d),
                ),
                Container(
                  margin: EdgeInsets.only(left: 3),
                  child: Text(
                    event.info.shareCount.toString(),
                    style: TextStyle(color: Color(0xff999999), fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.comment,
                  size: 12,
                  color: Color(0xff5d5d5d),
                ),
                Container(
                  margin: EdgeInsets.only(left: 3),
                  child: Text(
                    event.info.commentCount.toString(),
                    style: TextStyle(color: Color(0xff999999), fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  size: 12,
                  color: Color(0xff5d5d5d),
                ),
                Container(
                  margin: EdgeInsets.only(left: 3),
                  child: Text(
                    event.info.likedCount.toString(),
                    style: TextStyle(color: Color(0xff999999), fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 20,
              child: IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.more_vert,
                  size: 12,
                  color: Color(0xffb0b0b0),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
