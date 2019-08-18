import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/common/Utils.dart';

class PlayCount extends StatelessWidget {
  final double count;
  PlayCount(this.count);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 14,
        ),
        Text(
          '${Utils.toTenThousand(count)}',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
