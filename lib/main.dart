import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/page/HomePage.dart';
import 'package:cloud_music_mobile/common/dao/EventDao.dart';
import 'package:cloud_music_mobile/common/event/LoadingEvent.dart';
import 'package:cloud_music_mobile/widget/LoadingDialog.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:cloud_music_mobile/widget/PlayBar.dart';

AppState mainReducer(AppState state, action) {
  state.playInfoState = action;
  return state;
}

void main() {
  Store<AppState> store = Store<AppState>(mainReducer,
      initialState: AppState(
          playInfoState: PlayInfoState(
              url:
                  'http://m10.music.126.net/20190114161948/73365971a8a0c477a948cb9fc340e288/ymusic/c5e9/9900/3949/5cea2ee5ea7ac345d47db39af454e207.mp3',
              songName: '歌曲名称',
              songList: [])));

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
          title: 'cloud music',
          theme: ThemeData(
              // primarySwatch: Colors.blue,
              primaryColor: Color(0xffdd4137)),
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
