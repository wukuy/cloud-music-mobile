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

  Img(this.url,
      {this.width: 600,
      this.height: 600,
      this.radius: 4,
      this.color: Colors.transparent,
      this.fit: BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: url == null ? _placeholderPic() : _fadeInImage()),
    );
  }

  _fadeInImage() {
    return FadeInImage.assetNetwork(
      width: width,
      height: height,
      placeholder: ConstDefine.placeholderPic,
      image: _reqImgSizeSet(),
      fit: fit,
    );
  }

  _placeholderPic() {
    return Image.asset(
      ConstDefine.placeholderPic,
      width: width,
      height: height,
      fit: fit,
    );
  }

  _reqImgSizeSet() {
    int imgWidth = (width * 1.6).round();
    int imgHeight = (height * 1.6).round();

    return "$url?imageView=1&thumbnail=${imgWidth}z$imgHeight&type=webp&quality=90";
  }
}
