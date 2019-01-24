import 'package:cloud_music_mobile/models/Song.dart';

class PlayInfoState {
  int playSongId;
  String url;
  List<Song> songList;

  PlayInfoState(this.playSongId, this.songList, {this.url});

  getPlayInfo() {
    Song song;
    for(int idx = 0; idx < songList.length; idx++){
      if(songList[idx].songId == playSongId) {
        song = songList[idx];
        return song;
      }
    }
  }
}

playInfoReducer(state, action) {
  if (action.runtimeType == PlayInfoState) {
    state = action;
  }
  return state;
}
