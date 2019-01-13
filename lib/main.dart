import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/page/HomePage.dart';
import 'package:cloud_music_mobile/common/dao/EventDao.dart';
import 'package:cloud_music_mobile/common/event/LoadingEvent.dart';
import 'package:cloud_music_mobile/widget/LoadingDialog.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:audioplayer/audioplayer.dart';

AppState mainReducer(AppState state, action) {
  return state;
}

void main() {
   Store<AppState> store = Store<AppState>(mainReducer, initialState: AppState(
    playInfoState: PlayInfoState(
      url: 'http://m10.music.126.net/20190112190259/dd105d431403de002bbc845459472ad3/ymusic/5258/0f5f/015c/e23eb784398544031837660e6d233a6e.mp3',
      songName: '',
      songList: []
    )
  ));

   runApp(CloudMusic(store));
}

class CloudMusic extends StatelessWidget {
  Store<AppState> store;

  CloudMusic(this.store);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cloud music',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          primaryColor: Color(0xffdd4137)),
      home: BusEventProvider(child: StoreProvider(
        store: store,
        child: HomePage()
      )),
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
