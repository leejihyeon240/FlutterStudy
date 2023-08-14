import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {

  final XFile video;

  const CustomVideoPlayer({required this.video, Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  initializeController() async { // initState()는 async를 사용할 수 없어서 새로운 함수 만들어서 저쪽에서 불러오도록 해야함
    videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController!.initialize();

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    if(videoController == null){
      return CircularProgressIndicator(); // 로딩바 띄우기
    }

    return AspectRatio(
      aspectRatio: videoController!.value.aspectRatio,
      child: VideoPlayer(
          videoController!,
      ),
    );
  }
}
