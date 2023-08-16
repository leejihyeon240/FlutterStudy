import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onNewVideoPressed; // 외부에서 받아줘야힘

  const CustomVideoPlayer(
      {required this.video, required this.onNewVideoPressed, Key? key})
      : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;
  Duration currentPosition = Duration();
  bool showControls = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeController();
  }

  //  영상 바꼈을 때 다시 init 되야함
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget){
    super.didUpdateWidget(oldWidget);

    if(oldWidget.video.path != widget.video.path){
      initializeController();
    }
  }

  initializeController() async {
    currentPosition = Duration(); // 버그 수정

    // initState()는 async를 사용할 수 없어서 새로운 함수 만들어서 저쪽에서 불러오도록 해야함
    videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController!.initialize();

    videoController!.addListener(() async {
      // videoController의 값이 변경될 때마다 실행이 됨
      final currentPosition = videoController!.value.position;

      setState(() {
        // 슬라이더 작동
        this.currentPosition = currentPosition;
      });
    });

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
      child: GestureDetector(
        onTap: () {
          setState(() {
            showControls = !showControls; // 재생, 앞, 뒤 버튼 보이게 - 안 보이게
          });
        },
        child: Stack(
          children: [
            VideoPlayer(
              videoController!,
            ),
            if (showControls)
              _Controls(
                onReversePressed: onReversePressed,
                onPlayPressed: onPlayPressed,
                onForwardPressed: onForwardPressed,
                isPlaying: videoController!.value.isPlaying,
              ),
            if (showControls)
              _NewVideo(
                onPressed: widget.onNewVideoPressed, // 외부에서 받기
              ),
            _SliderBottom(
                currentPosition: currentPosition,
                maxPosition: videoController!.value.duration,
                onSliderChanged: onSliderChanged),
          ],
        ),
      ),
    );
  }

  void onSliderChanged(double val) {
    videoController!.seekTo(
      Duration(
        seconds: val.toInt(),
      ),
    );
  }

  void onReversePressed() {
    final currentPosition = videoController!.value.position; // 현재 영상 포지션

    // 만약에 2초 재생인데 누르면, 0초로 돌아가게끔
    Duration position = Duration(); // 기본 포지션은 0초, -2초전 이런 건 없으니까 미리 방지하기 위한

    if (currentPosition.inSeconds > 3) {
      position = currentPosition - Duration(seconds: 3); // 현재에서 3초 뺀 값
    }

    videoController!.seekTo(position); // seekTo --> 지점 찾기
  }

  void onPlayPressed() {
    // 이미 실행 중이면 중지
    // 실행 중이 아니면 실행
    setState(() {
      // setState 해줘야함, 안 해주면 안 변함
      if (videoController!.value.isPlaying) {
        // isPlaying --> 실행 중인지
        videoController!.pause(); // 중지
      } else {
        videoController!.play(); // 재생
      }
    });
  }

  void onForwardPressed() {
    final maxPosition = videoController!.value.duration; // 전체 영상 길이
    final currentPosition = videoController!.value.position; // 현재 영상 포지션

    // if 조건에 해당 안 될 경우, 최대 포지션
    Duration position = maxPosition;

    // 최대 포지션에서 3을 뺀 값보다 작다면, +3초
    if ((maxPosition - Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3); // 현재에서 3초 뺀 값
    }

    videoController!.seekTo(position); // seekTo --> 지점 찾기
  }
}

class _Controls extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _Controls({
    required this.onPlayPressed,
    required this.onReversePressed,
    required this.onForwardPressed,
    required this.isPlaying,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          renderIconButton(
              onPressed: onReversePressed, iconData: Icons.rotate_left),
          renderIconButton(
              onPressed: onPlayPressed,
              iconData: isPlaying ? Icons.pause : Icons.play_arrow),
          renderIconButton(
              onPressed: onForwardPressed, iconData: Icons.rotate_right),
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

class _NewVideo extends StatelessWidget {
  final VoidCallback onPressed;

  const _NewVideo({required this.onPressed, Key? key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        onPressed: onPressed,
        color: Colors.white,
        iconSize: 30.0,
        icon: Icon(
          Icons.photo_camera_back,
        ),
      ),
    );
  }
}

class _SliderBottom extends StatelessWidget {
  final Duration currentPosition;
  final Duration maxPosition;
  final ValueChanged<double> onSliderChanged; // 외부 함수

  const _SliderBottom({
    required this.currentPosition,
    required this.maxPosition,
    required this.onSliderChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              // padLeft --> 2자리 수 보여줄 거고, 공백에는 0을 넣어줄 것이다
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Slider(
                value: currentPosition.inSeconds.toDouble(),
                onChanged: onSliderChanged,
                max: maxPosition.inSeconds.toDouble(),
                min: 0,
              ),
            ),
            Text(
              '${maxPosition.inMinutes}:${(maxPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              // padLeft --> 2자리 수 보여줄 거고, 공백에는 0을 넣어줄 것이다
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
