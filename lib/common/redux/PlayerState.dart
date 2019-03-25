import 'package:audioplayers/audioplayers.dart';

enum PlayActions { resume, play, pause }

class PlayerState {
  AudioPlayer audioPlayer;
  PlayActions state;

  PlayerState(PlayActions playActions) {
    state = playActions;
  }

  PlayerState.audioPlayer(this.audioPlayer) {
    addListen();
  }

  play(url) async {
    if (url != '') {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        print('播放');
      }
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print('暂停');
    }
  }

  resume() async {
    int result = await audioPlayer.resume();
    if (result == 1) {
      print('恢复播放');
    }
  }
  // 添加player事件
  addListen() {
    onPlayerCompletion();
  }
  onPlayerCompletion() {
    audioPlayer.onPlayerCompletion.listen((event) {

    });
  }
  // 播放上一曲
  playLastSong() {

  }
  // 播放下一曲
  playNextSong() {

  }
}

playerReducer(state, action) {
  if (action.runtimeType == PlayerState) {
    PlayActions playActions = action.state;
    String url = state.playInfoState.url;
    PlayerState playerState = state.playerState;
    playerState.state = action.state;

    switch (playActions) {
      case PlayActions.play:
        playerState.play(url);
        break;
      case PlayActions.pause:
        playerState.pause();
        break;
      case PlayActions.resume:
        playerState.resume();
        break;
    }
  }

  return state.playerState;
}
