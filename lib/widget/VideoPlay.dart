import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_music_mobile/models/VideoUrl.dart';
import 'package:cloud_music_mobile/common/dao/CommonDao.dart';

class VideoPlay extends StatefulWidget {
  final double radius;
  final double height;
  final String id;
  VideoPlay({this.id, this.radius = 8, this.height = 196});
  @override
  State<StatefulWidget> createState() {
    return _VideoPlayState();
  }
}

class _VideoPlayState extends State<VideoPlay> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  String url;

  @override
  void initState() {
    super.initState();
    this._getVideoUrl();
  }

  _videoPlayer() {
    _videoPlayerController = VideoPlayerController.network(url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.black,
      ),
      autoInitialize: true,
    );
  }

  _getVideoUrl() async {
    if (widget.id != null) {
      VideoUrl videoUrl = await CommonDao.getVideoUrl({'id': widget.id});
      url = videoUrl.urls[0].url;
      if (url != null) {
        _videoPlayer();
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: Container(
        height: widget.height,
        child: url != null
            ? Chewie(
                controller: _chewieController,
              )
            : Container(),
      ),
    );
  }
}
