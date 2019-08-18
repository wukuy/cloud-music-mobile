import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SpinKitWave(
            color: Theme.of(context).primaryColor,
            type: SpinKitWaveType.start,
            size: 14,
          ),
          Container(
            margin: EdgeInsets.only(left: 6),
            child: Text('努力加载中...', style: TextStyle(color: Colors.black45)),
          )
        ]));
  }
}
