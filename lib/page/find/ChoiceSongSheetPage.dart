import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';

class ChoiceSongSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('歌单'),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          _synopsis(),
          _title(),
          _songsheetList(),
        ],
      ),
    );
  }

  _synopsis() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int idx) {
          return Container(
            // height: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Img(
                  'http://p2.music.126.net/LiuIyh9du-WOk45hhR01IQ==/109951163464139769.jpg',
                  width: 126,
                  height: 126,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            Img(
                              'http://p2.music.126.net/LiuIyh9du-WOk45hhR01IQ==/109951163464139769.jpg',
                              width: 20,
                              height: 20,
                              radius: 10,
                            ),
                            Text('精品歌单'),
                            Icon(Icons.chevron_right)
                          ],
                        ),
                      ),
                      Container(
                        child: Text('(中文说唱) 用方言唱出中国制造'),
                      ),
                      Text('把方言嵌入在说唱歌曲里，展现中文的强大美里')
                    ],
                  ),
                )
              ],
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  _title() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[Text('全部歌单'), Icon(Icons.chevron_right)],
                  ),
                ),
                Wrap(
                  children: <Widget>[
                    InkWell(
                      child: Text('华语'),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Text('轻音乐'),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Text('摇滚'),
                      onTap: () {},
                    )
                  ],
                )
              ])
        ]),
      ),
    );
  }

  _songsheetList() {
    return SliverPadding(
      padding: EdgeInsets.only(left: 5, right: 5),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.8,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int idx) {
            return Container(
              child: Column(
                children: <Widget>[
                  Img(
                'http://p2.music.126.net/LiuIyh9du-WOk45hhR01IQ==/109951163464139769.jpg',
                height: 200,),
                Container(
                  child: Text('喜欢春天 好像什么都可以重新开始'),
                )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
