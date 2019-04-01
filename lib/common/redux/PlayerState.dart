import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_music_mobile/models/Song.dart';
import 'package:meta/meta.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
      if (url != null) {
        int result = await audioPlayer.play(url);
        if (result == 1) {
          print("播放");
        }
      }

      _savePlayerState();
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

  _savePlayerState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('playerState', toJson());
  }

  // 跳转播放
  seek(int milliseconds) {
    audioPlayer.seek(new Duration(milliseconds: milliseconds));
  }

  // 播放上一曲
  playLastSong() {
    if(playIdx - 1 < 0) {
      playIdx = playList.length - 1;
    }else {
      playIdx--;
    }
  }
  // 播放下一曲
  playNextSong() {
    if(playIdx + 1 >= playList.length) {
      playIdx = 0;
    }else {
      playIdx++;
    }
  }
  // 跳转播放
  seekPlay() {}

  _getSongUrl() async {
    Map result = await FindDao.getSongUrl({'id': playList[playIdx].songId});
    if (result != null) {
      return result['url'];
    }
  }

  setListen(store) {
    _onPlayerCompletion(store);
    _onPlayerStateChanged(store);
    _onAudioPositionChanged(store);
  }

  // 播放完成监听
  _onPlayerCompletion(store) {
    audioPlayer.onPlayerCompletion.listen((event) {
      if (mode == PlayModeActions.loop) {
        playNextSong();
      }

      if (mode == PlayModeActions.order) {
        if (playIdx + 1 >= playList.length) {
          print("歌曲列表播放完毕");
        } else {
          playIdx++;
        }
      }
      store.dispatch(PlayActions.play);
    });
  }

  // 播放状态监听
  _onPlayerStateChanged(store) {
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) => {});
  }

  // 播放进度监听
  _onAudioPositionChanged(store) {
    audioPlayer.onAudioPositionChanged.listen((Duration p) => {});
  }

  toJson() {
    return jsonEncode({
      "mode": mode.index,
      "playList": songListToJson(playList),
      "playIdx": playIdx,
      "progressBarPosition": progressBarPosition,
      "countDuration": countDuration,
    });
  }

  PlayerState.fromJson(Map map) {
    mode = map['mode'];
    playList = map['playList'];
    // 当前播放歌曲
    playIdx = map['playIdx'];
    progressBarPosition = map['progressBarPosition'];
    countDuration = map['countDuration'];
  }

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
  }

  return state;
}
