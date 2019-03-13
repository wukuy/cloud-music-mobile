import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/assets/ConstDefine.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Img extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double radius;
  final Color color;
  final BoxFit fit;

  Img(this.url, {this.width: 100, this.height: 100, this.radius: 4, this.color: Colors.transparent, this.fit: BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: FadeInImage.assetNetwork(
          width: width,
          height: height,
          placeholder: ConstDefine.placeholderPic,
          image: url ?? '',
          fit: fit,
        ),
      ),
    );
  }
}
