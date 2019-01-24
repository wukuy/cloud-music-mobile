import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cloud_music_mobile/assets/ConstDefine.dart';
import 'package:cloud_music_mobile/assets/style/ColorDefine.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/models/FindBanner.dart';

class SwiperAndMenu extends StatelessWidget {
  final List<Banners> bannerData;
  final List menus;
  SwiperAndMenu({this.bannerData, this.menus});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Banner(bannerData),
        Menu(menus),
        Divider(height: 1),
      ]),
    );
  }
}

// 轮播图
class Banner extends StatelessWidget {
  final List<Banners> data;
  Banner(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[_background(), _swiper()],
      ),
    );
  }

  _background() {
    return Positioned(
      // 使用row把背景宽度撑开
      child: Container(
        height: 110,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Color(0xffdd4137),
              ),
            )
          ],
        ),
      ),
    );
  }

  _swiper() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            child: Img(
              data.length > 0
                  ? data[index].imageUrl
                  : ConstDefine.placeholderPic,
              height: 120,
              radius: 6,
              fit: BoxFit.fitHeight,
              color: Color(ColorDefine.placeholder),
            ));
      },
      itemCount: data.length == 0 ? 2 : data.length,
      pagination: SwiperPagination(),
      // control: SwiperControl(),
      scale: 0.99,
      autoplay: true,
    );
  }
}

// 私人Fm、每日推荐... 菜单。
class Menu extends StatelessWidget {
  final List<MenuItem> menus;
  Menu(this.menus);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 12),
      child: Flex(
        direction: Axis.horizontal,
        children: menus.map((item) {
          return Expanded(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            offset: Offset(1.0, 2.0),
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
                  child: Container(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      item.text,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
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
