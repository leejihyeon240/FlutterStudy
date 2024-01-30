import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RootTap extends StatefulWidget {
  const RootTap({super.key});

  @override
  State<RootTap> createState() => _RootTapState();
}

class _RootTapState extends State<RootTap> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      child: Center(
        child: Text('Root Tap'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() { // setState 안 해주면 안 바뀜!!!
            this.index = index; // 선택된 index를 현재 index에 넣어줌
          });
        },
        currentIndex: index,
        items: [
          // 네비게이션할 아이템들에 대한 정보를 넣어주면 됨
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined), label: '음식'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined), label: '주문'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: '프로필'),
        ],
      ),
    );
  }
}
