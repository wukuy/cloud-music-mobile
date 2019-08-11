import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/common/Utils.dart';

class PlayCount extends StatelessWidget {
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
          '${Utils.toTenThousand(100000)}',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
