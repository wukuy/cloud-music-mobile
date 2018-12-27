import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cloud_music_mobile/widget/RecommendBox.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecommendPageState();
}

/* RecommendSongSheet() */
class _RecommendPageState extends State {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        /* SliverList(
          delegate: SliverChildListDelegate([
            ListView(
              children: <Widget>[
                Banner(),
                Menu(),
                Divider(height: 1),
              ],
            ),
          ]),
        ), */
        /* SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Text('$index');
            },
            childCount: 3,
          ),
        ),
         */

        SliverList(
          delegate: SliverChildListDelegate(
            [
              Banner(),
              Menu(),
              Divider(height: 1),
            ],
          ),
        ),
        SliverGrid(
            //Grid
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              },
              childCount: 20,
            ))
      ],
    );
  }
}

// 轮播图
class Banner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Banner();
}

class _Banner extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[
          Positioned(
            // 使用row把背景宽度撑开
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Color(0xffdd4137),
                    height: 110,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          "http://via.placeholder.com/350x150",
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 3,
                      pagination: SwiperPagination(),
                      control: SwiperControl(),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 私人Fm、每日推荐... 菜单。
class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Menu();
}

class _Menu extends State {
  List<MenuItem> _menus = [
    MenuItem(icon: Icons.radio, text: '私人FM'),
    MenuItem(icon: Icons.date_range, text: '内容推荐'),
    MenuItem(icon: Icons.queue_music, text: '歌单'),
    MenuItem(icon: Icons.donut_large, text: '排行榜'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Flex(
        direction: Axis.horizontal,
        children: _menus.map((item) {
          return Expanded(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffdd4137),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffff639b),
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(1.0, 1.0),
                          ),
                        ]),
                    width: 50,
                    height: 50,
                    child: Icon(
                      item.icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  child: Text(item.text),
                  onTap: () {},
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MenuItem {
  IconData icon;
  String text;

  MenuItem({this.icon, this.text});
}

// 推荐歌单
class RecommendSongSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecommendSongSheet();
}

class _RecommendSongSheet extends State {
  @override
  Widget build(BuildContext context) {
    return RecommendBox(children: <Widget>[
      Image.network(
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=588638640,2489549019&fm=27&gp=0.jpg'),
      Image.network(
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=588638640,2489549019&fm=27&gp=0.jpg'),
      Image.network(
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=588638640,2489549019&fm=27&gp=0.jpg'),
      Image.network(
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=588638640,2489549019&fm=27&gp=0.jpg'),
      Image.network(
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=588638640,2489549019&fm=27&gp=0.jpg'),
      Image.network(
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=588638640,2489549019&fm=27&gp=0.jpg'),
    ]);
  }
}
