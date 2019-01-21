
class PlayInfoState {
  String url;
  String songName;
  String singer;
  List songList;
  String coverPic;

  PlayInfoState(
      {this.singer, this.coverPic, this.url, this.songName, this.songList});
}

playInfoReducer(state, action) {
  if(action.runtimeType == PlayInfoState) {
    state = action;
  }
  return state;
}
