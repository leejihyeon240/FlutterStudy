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

    initializeController();

  }

  initializeController() async {
    // initState()는 async를 사용할 수 없어서 새로운 함수 만들어서 저쪽에서 불러오도록 해야함
    videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController!.initialize();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return CircularProgressIndicator(); // 로딩바 띄우기
    }

    return AspectRatio(
      // 원래 비율로 설정
      aspectRatio: videoController!.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            videoController!,
          ),
          _Controls(),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {},
              color: Colors.white,
              iconSize: 30.0,
              icon: Icon(
                Icons.photo_camera_back,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Controls extends StatelessWidget {
  const _Controls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          renderIconButton(onPressed: () {}, iconData: Icons.rotate_left),
          renderIconButton(onPressed: () {}, iconData: Icons.play_arrow),
          renderIconButton(onPressed: () {}, iconData: Icons.rotate_right),
        ],
      ),
    );
  }

  Widget renderIconButton({
    required VoidCallback onPressed,
    required IconData iconData, // iconData란, 안에 실제 들어가는 아이콘
  }) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 30.0,
      color: Colors.white,
      icon: Icon(
        iconData,
      ),
    );
  }
}
