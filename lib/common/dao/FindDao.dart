import 'package:cloud_music_mobile/common/Http.dart';
import 'package:cloud_music_mobile/models/FindBanner.dart';
import 'package:cloud_music_mobile/models/Recommend.dart';
import 'package:cloud_music_mobile/models/SongDetail.dart';
import 'package:cloud_music_mobile/models/Song.dart';
import 'package:cloud_music_mobile/models/SongSheetCategorys.dart';
import 'package:cloud_music_mobile/models/ExcellentSheetSong.dart';
import 'package:cloud_music_mobile/models/HotSongSheetCategorys.dart';
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
      result[2]["result"] =
          result[2]["result"].map((item) => item["song"]["album"]).toList();
      List banners = FindBanner.fromJson(result[0]).banners;
      List songSheet = Recommend.fromJson(result[1]).result;
      List newsong = Recommend.fromJson(result[2]).result;
      List djprogram = Recommend.fromJson(result[3]).result;

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

  /// 获取推荐歌单
  static getPersonalized() async {
    var result = await Http(loading: false).get('/personalized');
    if (result != null) {
      return Recommend.fromJson(result);
    }
  }

  /// 获取歌单详情
  static getSongDetail(data) async {
    var result = await Http(loading: false).get('/playlist/detail', data: data);

    if (result != null) {
      Map data = result["playlist"];
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
      return result["data"][0];
    }
  }

  // 获取歌单分类
  static getSongSheetCategorys() async {
    var result = await Http(loading: false).get('/playlist/catlist');
    if (result != null) {
      return SongSheetCategorys.fromJson(result);
    }
  }

  // 获取热门歌单分类
  static getHotSongSheetCategorys() async {
    var result = await Http(loading: false).get('/playlist/hot');
    if (result != null) {
      return HotSongSheetCategorys.fromJson(result);
    }
  }

  // 获取精品歌单
  static getExcellentSheetSong(Map<String, dynamic> data) async {
    var result =
        await Http(loading: false).get('/top/playlist/highquality', data: data);
    if (result != null) {
      return ExcellentSheetSong.fromJson(result);
    }
  }

  // 获取歌单
  static getSheetSong(Map<String, dynamic> data) async {
    var result = await Http(loading: false).get('/top/playlist', data: data);
    if (result != null) {
      return ExcellentSheetSong.fromJson(result);
    }
  }
}
