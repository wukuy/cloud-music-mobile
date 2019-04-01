import 'package:cloud_music_mobile/common/Http.dart';
import 'package:cloud_music_mobile/models/FindBanner.dart';
import 'package:cloud_music_mobile/models/Recommend.dart';
import 'package:cloud_music_mobile/models/SongDetail.dart';
import 'package:cloud_music_mobile/models/Song.dart';
import 'dart:math';

class FindDao {
  // 获取发现页面接口数据获取
  static getFindPageData() async {
    var result = await Http.all([
      /// 获取轮播图
      Http(loading: false).get('/banner'),
      /// 获取推荐歌单
      Http(loading: false).get('/personalized'),
      /// 获取最新音乐
      Http(loading: false).get('/personalized/newsong'),
      /// 获取主播电台
      Http(loading: false).get('/personalized/djprogram')
    ]);

    if (result != null) {
      // 数据提取
      result[2].data["result"] = result[2]
          .data["result"]
          .map((item) => item["song"]["album"])
          .toList();
      List banners = FindBanner.fromJson(result[0].data).banners;
      List songSheet = Recommend.fromJson(result[1].data).result;
      List newsong = Recommend.fromJson(result[2].data).result;
      List djprogram = Recommend.fromJson(result[3].data).result;

      songSheet.shuffle(Random());
      newsong.shuffle(Random());
      djprogram.shuffle(Random());

      Map map = {
        'banner': banners,
        'songSheet': songSheet,
        'newsong': newsong,
        'djprogram': djprogram
      };
      return map;
    }
  }

  /// 获取歌单详情
  static getSongDetail(data) async {
    var result = await Http(loading: false).get('/playlist/detail', data: data);  
    
    if (result != null && result.data["code"] == 200) {
      Map data = result.data["playlist"];
      List<Song> playlist = [];
      data["tracks"].forEach((item) {
        playlist.add(Song.fromJson({
          "songName": item["name"],
          "songId": item["id"],
          "singer": item["ar"][0]["name"],
          "coverPic": item["al"]["picUrl"],
        }));
      });

      var info = {
        "title": data["name"],
        "nickname": data["creator"]["nickname"],
        "avatarUrl": data["creator"]["avatarUrl"],
        "commentCount": data["commentCount"],
        "shareCount": data["shareCount"]
      };

      return {
        "info": SongDetail.fromJson(info),
        "playlist": playlist,
      };
    }
  }

  /// 获取歌曲
  static getSongUrl(data) async {
    var result = await Http(loading: false).get('/song/url', data: data);
    if (result != null) {
      return result.data["data"][0];
    }
  }
}
