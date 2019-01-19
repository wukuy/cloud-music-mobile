import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';

class FriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FriendPageState();
}

class _FriendPageState extends State with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      builder: (BuildContext context, Store<AppState> store) {
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor,),
          child: InkWell(
            onTap: () {},
            child: Text('data'),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
