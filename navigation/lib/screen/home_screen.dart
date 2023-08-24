import 'package:flutter/material.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/layout/main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 갤럭시에서 뒤로가기 눌렀을 때 시스템에서 앱 종료 못하도록 방지 하는 것
        // ture - pop 가능
        // false - pop 불가능
        // return false;

        // 작업 실행
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(
        title: 'Home Screen',
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).maybePop(); // 더이상 뒤로 갈 곳이 없을 때 오류 방지
                // 앱을 끝내버리는 실수를 방지할 수 있음
              },
              child: Text('Maybe Pop')),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                    number: 123,
                  ),
                ),
              );
            },
            child: Text('push'),
          ),
        ],
      ),
    );
  }
}
