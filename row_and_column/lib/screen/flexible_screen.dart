import 'package:flutter/material.dart';

class FlexibleScreen extends StatelessWidget {
  const FlexibleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          // Row랑 Column 모두 구현
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible( // Row랑 Column 안에서만 사용 가능
                // 남는 공간은 그냥 버림
                // flex: 로 비율 설정 가능
                // fit에 BoxFit.loose를 넣으면 Flexible BoxFit.tight를 넣으면 Expanded
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.red,
                ),
              ),
              Flexible(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.yellow,
                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

