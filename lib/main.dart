import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/page/HomePage.dart';
import 'package:cloud_music_mobile/common/dao/EventDao.dart';
import 'package:cloud_music_mobile/common/event/LoadingEvent.dart';
import 'package:cloud_music_mobile/widget/LoadingDialog.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayerState.dart';
import 'package:cloud_music_mobile/widget/PlayBar.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_music_mobile/models/Song.dart';

void main() async {
  PlayerState playerState = await playerStateInit();
   
  Store<AppState> store = Store<AppState>(
    mainReducer,
    initialState: AppState(
      playerState: playerState,
    ),
  );

  playerState.setListen(store);
  runApp(CloudMusic(store));
}

// 播放器状态初始化
Future playerStateInit() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String playerStr = pref.getString("playerState");

  if(playerStr != null) {
    Map playerMap = jsonDecode(playerStr);
    return PlayerState(
      mode: PlayModeActions.values[playerMap['mode']],
      playList: getSongList(playerMap['playList']),
      playIdx: playerMap['playIdx']
    );
  }
  return PlayerState(playList: []);
}

class CloudMusic extends StatelessWidget {
  final Store<AppState> store;

  CloudMusic(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
          title: '云音乐',
          theme: ThemeData(
            primaryColor: Color(0xffdd4137),
            splashColor: Color(0x22000000),
          ),
          home: BusEventProvider(child: StoreBuilder(
            builder: (BuildContext context, Store<AppState> store) {
              return _homeWidgets(store);
            },
          ))),
    );
  }

  _homeWidgets(Store<AppState> store) {
    List<Widget> childrens = [];
    childrens.add(Expanded(
      flex: 1,
      child: HomePage(),
    ));

    // add play bar
    if (store.state.playerState.playList.length > 0) {
      childrens.add(PlayBar());
    }

    return Flex(
      direction: Axis.vertical,
      children: childrens,
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
