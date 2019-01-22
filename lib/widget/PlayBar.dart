import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:cloud_music_mobile/page/common/PlayDetailPage.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/common/redux/PlayerState.dart';
import 'package:cloud_music_mobile/widget/BottomSheetPlayList.dart';

class PlayBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, Store<AppState> store) {
        PlayInfoState playInfoState = store.state.playInfoState;
        PlayerState playerState = store.state.playerState;

        bool playState = (PlayActions.play.index == playerState.state ||
            PlayActions.resume.index == playerState.state);

        return Container(
          height: 46,
          padding: EdgeInsets.only(left: 6, right: 6),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xffeeeeee)))),
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PlayDetailPage()));
              },
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 36,
                    height: 36,
                    margin: EdgeInsets.only(right: 10),
                    child: Img(playInfoState.coverPic),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            playInfoState.songName,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Text(
                          playInfoState.singer ?? '',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black38,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          store.dispatch(PlayerState(playState
                              ? PlayActions.pause
                              : PlayActions.resume));
                        },
                        child: Icon(
                          playState
                              ? Icons.pause_circle_outline
                              : Icons.play_circle_outline,
                          size: 32,
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12, right: 4),
                        child: InkWell(
                          onTap: () {
                            BottomSheetPlayList.show(context);
                          },
                          child: Icon(
                            Icons.list,
                            size: 32,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
