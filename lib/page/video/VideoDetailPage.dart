import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/VideoPlay.dart';
import 'package:cloud_music_mobile/widget/Img.dart';

class VideoDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoDetailPageState();
  }
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff3f3f3),
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 400, minHeight: 200),
              child: VideoPlay(
                radius: 0,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  VideoDetailInfo(),
                  Comments(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VideoDetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  '超强音浪: 经历来宾黄压力，台上再唱成名曲《蝴蝶泉边》',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(Icons.keyboard_arrow_down),
              ),
            ],
          ),
          Wrap(
            children: <Widget>[
              Text('2444次观看'),
              Chip(
                label: Text('#光阴在在 岁月留痕~至回不去的青涩时光#'),
              ),
              Chip(
                label: Text('流行'),
              ),
              Chip(
                label: Text('音乐'),
              ),
              Chip(
                label: Text('中文翻唱'),
              )
            ],
          ),
          Text('2019-4-30 发布时间'),
          Text('14年后，翻开了法拉为iuro反抗军法法会计科法科技会计科' * 3),
          Divider(),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Img(
                          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2156421975,3337537785&fm=26&gp=0.jpg',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Text('我叫小林林'),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 26,
                  child: FlatButton(
                    shape: StadiumBorder(),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      '+ 关注',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Comments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('精彩评论'),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Img(
                    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2156421975,3337537785&fm=26&gp=0.jpg',
                    height: 30,
                    width: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4),
                  child: Text('我叫小林林'),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Img(
                    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2156421975,3337537785&fm=26&gp=0.jpg',
                    height: 30,
                    width: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4),
                  child: Text('我叫小林林'),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Img(
                    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2156421975,3337537785&fm=26&gp=0.jpg',
                    height: 30,
                    width: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4),
                  child: Text('我叫小林林'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
