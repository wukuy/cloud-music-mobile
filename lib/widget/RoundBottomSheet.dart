import 'package:flutter/material.dart';

/// 底部分类菜单
class RoundBottomSheet {
  static show(context, {int height: 380, @required Widget child}) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Container(
              height: 25,
              color: Colors.black54,
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: Container(
                color: Colors.white,
                height: 380,
                width: double.infinity,
                child: child,
              ),
            )
          ],
        );
      },
    );
  }
}
