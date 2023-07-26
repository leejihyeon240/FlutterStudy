import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // 마크 없애기
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF99231), // 배경색 설, 정확한 색을 쓸 땐 HEX코드 사용, ox --> 16진수 / FF --> 투명도
      body: Column( // Column = 디폴드 값이 제일 위에
        mainAxisAlignment: MainAxisAlignment.center, // mainAxisAlignment = 주축(세로), 가운데 정렬
        children: [
          Image.asset(
            'asset/img/logo.png',
          ),
          CircularProgressIndicator( // 로딩
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}