import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_music_mobile/models/Song.dart';
import 'package:meta/meta.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';

enum PlayActions { play, pause }
enum PlayModeActions { loop, random, order, singleLoop }

class PlayerState {
  AudioPlayer audioPlayer;
  PlayActions state;
  PlayModeActions mode;
  List<Song> playList;
  // 当前播放歌曲
  int playIdx;
  int progressBarPosition;
  int countDuration;

  PlayerState(
      {this.mode = PlayModeActions.loop,
      @required this.playList,
      this.playIdx,
      this.progressBarPosition,
      this.countDuration}) {
    audioPlayer = AudioPlayer();
  }

  play() async {
    if (AudioPlayerState.PAUSED == audioPlayer.state) {
      resume();
    } else {
      String url = playList[playIdx].url = await _getSongUrl();
      print(url);
      if (url != null) {
        int result = await audioPlayer.play(url);
        if (result == 1) {
          print("播放");
        }
      }
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print("暂停");
    }
  }

  resume() async {
    int result = await audioPlayer.resume();
    if (result == 1) {
      print('恢复播放');
    }
  }

  // 播放上一曲
  playLastSong() {}
  // 播放下一曲
  playNextSong() {}
  // 跳转播放
  seekPlay() {}

  PlayerState.fromJson(Map map) {
    mode = map['mode'];
    playList = map['playList'];
    // 当前播放歌曲
    playIdx = map['playIdx'];
    progressBarPosition = map['progressBarPosition'];
    countDuration = map['countDuration'];
  }

  _getSongUrl() async {
    Map result = await FindDao.getSongUrl({'id': playList[playIdx].songId});
    if (result != null) {
      return result['url'];
    }
  }

  toJson() => {
        "mode": mode,
        "playList": playList,
        "playIdx": playIdx,
        "progressBarPosition": progressBarPosition,
        "countDuration": countDuration,
      };
  getPlayInfo() => playList[playIdx];
}

playerReducer(PlayerState state, action) {
  switch (action.runtimeType) {
    // 播放状态改变
    case PlayActions:
      state.state = action;
      if (PlayActions.play == action) {
        state.play();
      } else {
        state.pause();
      }
      break;
    // 播放模式
    case PlayModeActions:
      break;
    case PlayerState:
      break;
  }

  return state;
}
