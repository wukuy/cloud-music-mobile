class Song {
  // 歌曲id
  int songId;
  // 歌手
  int singer;
  // 封面
  int coverPic;
  // 歌曲url
  String url;
  // 歌曲名称
  String songName;

  Song({this.singer, this.coverPic, this.url, this.songName});
}

class PlayInfoState {
  int playSongId;
  List<Song> songList;

  PlayInfoState(this.playSongId, this.songList);
}

playInfoReducer(state, action) {
  if (action.runtimeType == PlayInfoState) {
    state = action;
  }
  return state;
}
