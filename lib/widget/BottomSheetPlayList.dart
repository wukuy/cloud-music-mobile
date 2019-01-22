import 'package:flutter/material.dart';

class BottomSheetPlayList {
  static show(context, List list) {
    list = [
      {"songName": '张三'},
      {"songName": '张三1'},
      {"songName": '张三2'},
      {"songName": '张三'}
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 395,
          decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              _title(),
              Divider(
                height: 1,
              ),
              Expanded(
                child: _list(list),
              )
            ],
          ),
        );
      },
    );
  }

  static _title() {
    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.live_help),
              Text('列表循环45'),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[Icon(Icons.live_help), Text('收藏全部')],
                ),
              ),
              Icon(Icons.delete)
            ],
          ),
        ],
      ),
    );
  }

  static _list(list) {a
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int idx) {
        return Container(
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
                      child: Text(list[idx]['songName']),
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
        );
      },
    );
  }
}
