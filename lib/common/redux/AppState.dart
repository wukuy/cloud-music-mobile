import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:cloud_music_mobile/common/redux/PlayerState.dart';

class AppState {
  PlayInfoState playInfoState;
  PlayerState playerState;
  
  AppState({this.playInfoState, this.playerState});
}

AppState mainReducer(AppState state, action) {
  
  return AppState(
    playInfoState: playInfoReducer(state.playInfoState, action),
    playerState: playerReducer(state, action)
  );
}