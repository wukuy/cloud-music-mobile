import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';

class FriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FriendPageState();
}

class _FriendPageState extends State with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          DynamicItem(),
          DynamicItem(),
          DynamicItem(),
          DynamicItem(),
          DynamicItem(),
          DynamicItem()
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class DynamicItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffe6e6e6), width: 0.5))),
      child: Column(
        children: <Widget>[
          DynamicItemTop(),
          DynamicItemContent(),
          DynamicItemBottom()
        ],
      ),
    );
  }
}

class DynamicItemTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // 头像
        Container(
          margin: EdgeInsets.only(right: 6),
          child: ClipOval(
            child: Image.network(
                'http://hbimg.b0.upaiyun.com/6d6ebe96ecc094b23e4b4716d1d911f1d7722371142c1-z9OZQK_fw658',
                width: 36,
                height: 36,
                fit: BoxFit.cover),
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
                              "国内爷",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff5078a6)),
                            ),
                            Text(
                              "发布视频",
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
                                "6654粉丝",
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

class DynamicItemContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 43, bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("文章这种状态，大部分男生都懂吧？"),
          Container(
            margin: EdgeInsets.only(bottom: 7, top: 7),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 4),
                    child: Img(
                      'http://hbimg.b0.upaiyun.com/6d6ebe96ecc094b23e4b4716d1d911f1d7722371142c1-z9OZQK_fw658',
                      height: 150,
                      // width: 120,
                    ),
                  ),
                ),
                Expanded(
                  child: Img(
                    'http://pic1.win4000.com/pic/2/18/bfc9b3a97c_250_350.jpg',
                    height: 150,
                    // width: 120,
                  ),
                )
              ],
            ),
          ),
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
                        'http://pic1.win4000.com/pic/2/18/bfc9b3a97c_250_350.jpg',
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
                  children: <Widget>[
                    Text('Fire Loop'),
                    Text(
                      '傻子与白痴',
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
      ),
    );
  }
}

class DynamicItemBottom extends StatelessWidget {
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
                    '88',
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
                    '88',
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
                    '88',
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
