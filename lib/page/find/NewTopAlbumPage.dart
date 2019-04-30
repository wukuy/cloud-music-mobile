import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';

class NewTopAlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新碟上架'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _title('新碟上架'),
          _album(3, 130, 0.7, 3),
          _title('本周新碟'),
          _album(2, 140, 1.0, 9),
        ],
      ),
    );
  }

  Widget _title(String text) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            height: 10,
            color: Colors.black.withOpacity(0.06),
          ),
          Container(
            padding: EdgeInsets.only(top: 14, left: 10, right: 10, bottom: 14),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _album(int crossAxisCount, double imgHeight,double childAspectRatio, int childCount) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 10, right: 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int idx) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Img(
                  'https://p2.music.126.net/aMxQ-UDjRNk0jY4IBsmKnA==/109951163065255921.jpg',
                  height: imgHeight,
                ),
                Container(
                  padding: EdgeInsets.only(top: 4),
                  child: Text('清高'),
                ),
                Container(
                  child: Text('HAO符号', style: TextStyle(fontSize: 10, color: Colors.black45),),
                )
              ],
            ),
          );
        }, childCount: childCount),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: childAspectRatio),
      ),
    );
  }
}
