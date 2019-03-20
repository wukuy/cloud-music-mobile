import 'package:flutter/material.dart';

class ListItemCustom extends StatelessWidget {
  final List<Widget> children;
  final double height;
  final Function onTap;

  ListItemCustom({this.children, this.height = 54, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10),
                  height: height,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: children
              ),
            ),
            Divider(
              height: 0,
            ),
          ],
        ));
  }
}
