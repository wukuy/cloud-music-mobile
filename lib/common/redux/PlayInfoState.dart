import 'package:cloud_music_mobile/models/Song.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PlayInfoState {
  int playSongId;
  String url;
  List<Song> songList;

  PlayInfoState(this.playSongId, this.songList, {this.url});

  saveLocal(int playSongId, List<Song> list) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
      List songList = getSongList(list);
      pref.setString("play", json.encode({
        "playSongId": playSongId,
        "playList": songList
      }));
  }
}

playInfoReducer(state, action) {
  if (action.runtimeType == PlayInfoState) {
    state = action;
  }
  return state;
}
