import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_music_mobile/assets/ConstDefine.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:cloud_music_mobile/common/redux/PlayerState.dart';
import 'package:cloud_music_mobile/widget/Img.dart';
import 'package:cloud_music_mobile/models/Song.dart';

class PlayDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        builder: (BuildContext context, Store<AppState> store) {
      PlayInfoState playInfoState = store.state.playInfoState;
      PlayerState playerState = store.state.playerState;
      Song info = playInfoState.getPlayInfo();

      return BackgroundBlur(Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(info.songName),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Divider(
              height: 2,
            ),
            Expanded(
              child: _content(info),
            ),
            _playCtrl(playerState, store)
          ],
        ),
      ));
    });
  }

  _content(Song info) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: 58),
            height: 283,
            width: 283,
            child: Image.asset(ConstDefine.cdDecorate1),
          ),
        ),
        Positioned(
            child: Container(
          margin: EdgeInsets.only(top: 62, left: 3),
          height: 275,
          width: 275,
          child: Image.asset(ConstDefine.cdDecorate),
        )),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(left: 50, top: 109),
            width: 182,
            height: 182,
            child: ClipOval(
              child: Img(info.coverPic),
            ),
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(left: 140),
            height: 124,
            width: 90,
            child: Image.asset(ConstDefine.cdPlayCtrl),
          ),
        ),
        Positioned(
            height: 45,
            bottom: 0,
            left: 20,
            right: 0,
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _menuItem(ConstDefine.love),
                _menuItem(ConstDefine.download),
                _menuItem(ConstDefine.soundEffects),
                _menuItem(ConstDefine.more),
              ],
            ))
      ],
    );
  }

  _menuItem(String image) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Image.asset(
          image,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  _playCtrl(playerState, Store<AppState> store) {
    bool playState = (PlayActions.play.index == playerState.state ||
        PlayActions.resume.index == playerState.state);

    return Container(
      height: 107,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Text(
                  '00:24',
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: Container(
                      height: 2,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          value: .4,
                          valueColor: AlwaysStoppedAnimation(Colors.red),
                        ),
                      )),
                ),
                Text(
                  '04:24',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              _ctrlItem(ConstDefine.playModeLoop),
              _ctrlItem(ConstDefine.playUp),
              _ctrlItem(
                playState ? ConstDefine.play : ConstDefine.playPause,
                onPressed: () {
                  store.dispatch(PlayerState(
                      playState ? PlayActions.pause : PlayActions.resume));
                },
              ),
              _ctrlItem(ConstDefine.playNext),
              _ctrlItem(ConstDefine.playList),
            ],
          ),
        ],
      ),
    );
  }

  _ctrlItem(String img, {Function onPressed}) {
    return Expanded(
      child: FlatButton(
        onPressed: onPressed,
        child: Container(
          height: 60,
          width: 60,
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class BackgroundBlur extends StatelessWidget {
  final Widget child;
  BackgroundBlur(this.child);

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, Store<AppState> store) {
        PlayInfoState playInfoState = store.state.playInfoState;
        Song info = playInfoState.getPlayInfo();

        return Container(
          child: Stack(
            children: [
              Positioned(
                child: ConstrainedBox(
                  constraints: new BoxConstraints.expand(),
                  child: Img(
                    info.coverPic,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: IgnorePointer(
                  ignoring: true,
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              Positioned(child: child)
            ],
          ),
        );
      },
    );
  }
}

/* 
ConstrainedBox(
                      child: Image.asset(
                        'lib/assets/image/head_pic.jpeg',
                        fit: BoxFit.cover,
                      ),
                      constraints: new BoxConstraints.expand())

 */
