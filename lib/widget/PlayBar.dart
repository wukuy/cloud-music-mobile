import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayBar extends StatelessWidget {
  AudioPlayer audioPlayer = new AudioPlayer();

  play(url) async {
    print('执行play方法');
    if (url != '') {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        print('播放');
      }
    }else {
      pause();
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

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, Store<AppState> store) {
        PlayInfoState playInfoState = store.state.playInfoState;
        play(playInfoState.url);
        print(playInfoState.songName);

        return Container(
          height: 46,
          padding: EdgeInsets.only(left: 6, right: 6),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xffeeeeee)))),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 36,
                height: 36,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(playInfoState.coverPic ??
                        'http://img5.duitang.com/uploads/item/201411/07/20141107164412_v284V.jpeg'),
                  ),
                ),
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
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: <Widget>[
                  Icon(Icons.merge_type),
                  Icon(Icons.message),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
