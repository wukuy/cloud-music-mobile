import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/widget/PlayCount.dart';
import 'package:cloud_music_mobile/page/find/SongDetailPage.dart';

class SongSheetGridView extends StatelessWidget {
  final List<SheetSong> sheetSongs;
  SongSheetGridView(this.sheetSongs);

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
          SheetSong sheetSong = sheetSongs[idx];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SongDetailPage(
                      title: sheetSong.name,
                      songSheetId: sheetSong.id,
                      authorName: sheetSong.name,
                      coverPic: sheetSong.coverImgUrl)));
            },
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Img(sheetSong?.coverImgUrl,
                            radius: 0, height: 104, width: 104),
                      ),
                      Positioned(
                        right: 4,
                        top: 4,
                        child: PlayCount(sheetSong?.playCount?.toDouble() ?? 0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    sheetSong?.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 13),
                  ),
                )
              ],
            ),
          );
        }, childCount: sheetSongs?.length ?? 0),
      ),
    );
  }
}

class SheetSong {
  String coverImgUrl;
  String name;
  double playCount;
  int id;
  SheetSong(
      {@required this.coverImgUrl,
      @required this.name,
      @required this.playCount,
      @required this.id});
}
