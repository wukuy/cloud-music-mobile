import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/widget/PlayCount.dart';

class SongSheetGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 14, right: 14),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          childAspectRatio: 10 / 13,
        ),
        delegate: SliverChildBuilderDelegate((context, idx) {
          return Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Img(
                        'http://via.placeholder.com/288x188',
                        radius: 0,
                        height: 104,
                      ),
                    ),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: PlayCount(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: Text(
                  '好想和喜欢的人一起去旅行呀!',
                  style: TextStyle(fontSize: 13),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
