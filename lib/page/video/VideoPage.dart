import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/VideoPlay.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/page/video/VideoDetailPage.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List list = [
    {
      'vidoeUrl': 'www.baidu.com',
      'title': '八斤猪肉',
      'headImg':
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg'
    },
    {
      'vidoeUrl': 'www.baidu.com',
      'title': '八斤猪肉',
      'headImg':
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg'
    },
    {
      'vidoeUrl': 'www.baidu.com',
      'title': '八斤猪肉',
      'headImg':
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg'
    }
  ];
  List<Choice> choices;
  @override
  void initState() {
    super.initState();
    choices = <Choice>[
      Choice(text: '推荐', tabView: VideoTabBarView(list)),
      Choice(text: 'LOOK直播', tabView: VideoTabBarView(list)),
      Choice(text: '音乐画面', tabView: VideoTabBarView(list)),
      Choice(text: '过火', tabView: VideoTabBarView(list)),
      Choice(text: '翻唱', tabView: VideoTabBarView(list)),
      Choice(text: '现场', tabView: VideoTabBarView(list)),
      Choice(text: 'mv', tabView: VideoTabBarView(list)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: choices.length,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            VideoTabBar(choices),
            Expanded(
              child: TabBarView(
                children:
                    choices.map((Choice choice) => choice.tabView).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Choice {
  String text;
  Widget tabView;
  Choice({@required this.text, @required this.tabView});
}

class VideoTabBar extends StatelessWidget {
  final List<Choice> choices;
  VideoTabBar(this.choices);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(top: 6),
      child: Container(
        height: 36,
        child: TabBar(
          tabs: choices.map((Choice choice) => Tab(text: choice.text)).toList(),
          indicatorColor: Colors.white,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 0,
            bottom: 0,
          ),
        ),
      ),
    );
  }
}

class VideoTabBarView extends StatelessWidget {
  final List list;
  VideoTabBarView(this.list);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff3f3f3),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int idx) {
          return Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  VideoPlay(),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        print('点击');
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return VideoDetailPage();
                        }));
                      },
                      child: Text(
                        'That girl翻唱排行榜第一人风俗分句可法方法粉色空间快乐精灵风俗法厄俄日噢喂瑞我如我iruowiruowiru' *
                            2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
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
                        Icon(
                          Icons.thumb_up,
                          size: 20,
                          color: Color(0xff888888),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 40),
                          child: Icon(
                            Icons.comment,
                            size: 20,
                            color: Color(0xff888888),
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Color(0xff666666),
                        )
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
