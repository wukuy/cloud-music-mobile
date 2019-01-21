import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/page/HomePage.dart';
import 'package:cloud_music_mobile/common/dao/EventDao.dart';
import 'package:cloud_music_mobile/common/event/LoadingEvent.dart';
import 'package:cloud_music_mobile/widget/LoadingDialog.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:cloud_music_mobile/common/redux/PlayerState.dart';
import 'package:cloud_music_mobile/widget/PlayBar.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  AudioPlayer audioPlayer = new AudioPlayer();

  Store<AppState> store = Store<AppState>(
    mainReducer,
    initialState: AppState(
      playInfoState: PlayInfoState(url: '', songName: '歌曲名称', songList: []),
      playerState: PlayerState.audioPlayer(audioPlayer)
    ),
  );

  runApp(CloudMusic(store));
}

class CloudMusic extends StatelessWidget {
  Store<AppState> store;

  CloudMusic(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
          title: '云音乐',
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            primaryColor: Color(0xffdd4137),
            // highlightColor: Colors.white70,
            splashColor: Color(0x22000000),
          ),
          home: BusEventProvider(
              child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: HomePage(),
              ),
              PlayBar()
            ],
          ))),
    );
  }
}

class BusEventProvider extends StatefulWidget {
  final Widget child;
  BusEventProvider({this.child});

  @override
  State<StatefulWidget> createState() => _BusEventProvider();
}

class _BusEventProvider extends State<BusEventProvider> {
  @override
  void initState() {
    super.initState();

    Loading.eventBus.on<LoadingEvent>().listen((event) {
      event.show ? showLoading() : hideLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  showLoading() {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) => LoadingDialog());
  }

  hideLoading() {
    Navigator.of(context).pop();
  }
}
