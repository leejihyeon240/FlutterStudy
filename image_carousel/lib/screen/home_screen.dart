import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      // periodic = setInterval() 같은 기능
      int currentPage = controller.page!.toInt(); // page는 double(0.7도 있기 때문)
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }

      controller.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,
      ); // curve는 애니메이션이 어떻게 움직이는 지 설정하는 것
    });
  }

  @override
  void dispose() {
    controller.dispose(); // controller도 타이머랑 같은 개념이라 dispose 해줘야 함
    // 과하게 소비되는 메모리를 막음
    if (timer != null) {
      timer!.cancel(); // timer가 null이 아닌데 인식 못해서 ! 붙여줌
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark); // 상태바 색깔 바꾸기

    return Scaffold(
      // 서랍, 스낵바, 하단 시트를 보여주고 플로팅 버튼을 보여줌
      body: PageView(
        // PageView 안에 넣으면 자동으로 스크롤이 되는 화면이 나옴
        controller: controller, // PageView가 생성되는 순간 알아서 controller가 붙어 작동함
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Image.asset(
                'asset/img/image_$e.jpeg',
                fit: BoxFit.cover,
              ),
            )
            .toList(), // children은 항상 list로 받기 때문에 toList() 무조건 해줘야함
        //   // children : 파라미터를 복수로 받아들일 수 있음
        //   Image.asset(
        //     'asset/img/image_1.jpeg',
        //     fit: BoxFit.cover, // cover : 전체화면 만들기
        //   ),
        //   Image.asset(
        //     'asset/img/image_2.jpeg',
        //     fit: BoxFit.cover,
        //   ),
        //   Image.asset(
        //     'asset/img/image_3.jpeg',
        //     fit: BoxFit.cover,
        //   ),
        //   Image.asset(
        //     'asset/img/image_4.jpeg',
        //     fit: BoxFit.cover,
        //   ),
        //   Image.asset(
        //     'asset/img/image_5.jpeg',
        //     fit: BoxFit.cover,
        //   ),
        // ],
      ),
    );
  }
}
