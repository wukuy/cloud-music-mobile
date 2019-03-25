import 'dart:convert';

class Song {
  // 歌曲id
  int songId;
  // 歌手
  String singer;
  // 封面
  String coverPic;
  // 歌曲url
  String url;
  // 歌曲名称
  String songName;

  Song({this.songId, this.singer, this.coverPic, this.url, this.songName});

  static toJson(Song song) {
    return jsonEncode({
      "songId": song.songId,
      "singer": song.singer,
      "coverPic": song.coverPic,
      "url": song.url,
      "songName": song.songName
    });
  }
  Song.formJson(Map map) {
    songId = map["songId"];
    singer = map["singer"];
    coverPic = map["coverPic"];
    url = map["url"];
    songName = map["songName"];
  }
}
