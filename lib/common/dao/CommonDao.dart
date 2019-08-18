import 'package:cloud_music_mobile/common/Http.dart';
import 'package:cloud_music_mobile/models/HotSearch.dart';
import 'package:cloud_music_mobile/models/SearchSong.dart';
import 'package:cloud_music_mobile/models/VideoUrl.dart';

class CommonDao {
  static hotSearch() async {
    var result = await Http(loading: false).get('/search/hot');

    if (result != null) {
      return HotSearch.fromJson(result.data).result;
    }
  }

  static searchSong(Map<String, dynamic> data) async {
    var result = await Http(loading: false).get('/search/suggest', data: data);

    if (result != null) {
      return SearchSong.fromJson(result.data).result;
    }
  }

  static getVideoUrl(Map<String, dynamic> data) async {
    var result = await Http(loading: false).get('/video/url', data: data);
    if (result != null) {
      return VideoUrl.fromJson(result);
    }
  }
}
