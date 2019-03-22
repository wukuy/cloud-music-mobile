import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FriendPageState();
}

class _FriendPageState extends State with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[ShareItem()],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ShareItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xfff5f5f5)))
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: ClipOval(
              child: Image.network(
                  'http://hbimg.b0.upaiyun.com/6d6ebe96ecc094b23e4b4716d1d911f1d7722371142c1-z9OZQK_fw658',
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "国内爷发布视频",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "6654粉丝",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Text('+ 关注', style: TextStyle(color: Colors.white, ),),
                      shape: StadiumBorder(),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[Text("文章这种状态，大部分男生都懂吧？")],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
