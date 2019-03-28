import 'package:cloud_music_mobile/common/redux/PlayerState.dart';

class AppState {
  PlayerState playerState;
  
  AppState({this.playerState});
}

AppState mainReducer(AppState state, action) {
  return AppState(
    playerState: playerReducer(state.playerState, action)
  );
}