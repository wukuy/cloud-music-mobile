import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';

class BackgroundBlur extends StatelessWidget {
  final Widget child;
  final String coverPic;
  final Color maskColor;
  BackgroundBlur(
      {@required this.child,
      @required this.coverPic,
      @required this.maskColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                // constraints: BoxConstraints.expand(),
                child: Img(
                  coverPic,
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            child: IgnorePointer(
              // ignoring: true,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: maskColor,
                ),
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
