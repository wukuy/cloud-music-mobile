import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/widget/Img.dart';

class BackgroundBlur extends StatelessWidget {
  final Widget child;
  final String coverPic;
  BackgroundBlur({this.child, this.coverPic});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Img(
                  coverPic,
                  fit: BoxFit.cover,
                  noSetReqImgSize: false,
                )),
          ),
          Positioned(
            child: IgnorePointer(
              // ignoring: true,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: Colors.white.withOpacity(0.9),
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
