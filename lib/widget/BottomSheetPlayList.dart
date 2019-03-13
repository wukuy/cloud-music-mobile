import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:cloud_music_mobile/common/redux/AppState.dart';
import 'package:cloud_music_mobile/models/Song.dart';
import 'package:cloud_music_mobile/common/dao/FindDao.dart';
import 'package:cloud_music_mobile/common/redux/PlayInfoState.dart';
import 'package:cloud_music_mobile/common/redux/PlayerState.dart';
import 'package:cloud_music_mobile/assets/ConstDefine.dart';

class BottomSheetPlayList {
  static show(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StoreBuilder<AppState>(
          builder: (BuildContext context, Store<AppState> store) {
            List<Song> list = store.state.playInfoState.songList;

            return Container(
              height: 395,
              decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  _title(list),
                  Divider(
                    height: 1,
                  ),
                  Expanded(
                    child: list.length > 0 ? _list(store) : _nodata(),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  static _nodata() {
    return Center(
      child: Text(
        '暂无歌曲',
        style: TextStyle(color: Color(0xff666666)),
      ),
    );
  }

  static _title(List<Song> list) {

    return Container(
      height: 48,
      child: Container(
        padding: EdgeInsets.only(left: 14, right: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.loop),
                Text(
                  '列表循环(${list.length})',
                  style: TextStyle(color: Color(0xff333333)),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.live_help),
                      Text(
                        '收藏全部',
                        style: TextStyle(color: Color(0xff333333)),
                      )
                    ],
                  ),
                ),
                Icon(Icons.delete)
              ],
            ),
          ],
        ),
      ),
    );
  }

  static _list(Store<AppState> store) {
    List<Song> list = store.state.playInfoState.songList;

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int idx) {
        return InkWell(
          onTap: () {
            _getSongUrl(store, list[idx].songId, list, () {
              Navigator.of(context).pop();
            });
          },
          child: Container(
            padding: EdgeInsets.only(left: 6, right: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 44,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            list[idx].songName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        children: <Widget>[
                          Icon(Icons.code),
                          Icon(Icons.close),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(height: 1)
              ],
            ),
          ),
        );
      },
    );
  }

  static _getSongUrl(Store store, id, list, cb) async {
    Map result = await FindDao.getSongUrl({'id': id});
    if (result != null) {
      store.dispatch(PlayInfoState(id, list, url: result["url"]));
      store.dispatch(PlayerState(PlayActions.play));
      if (cb != null) cb();
    }
  }
}
