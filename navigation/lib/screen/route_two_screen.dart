import 'package:flutter/material.dart';
import 'package:navigation/screen/route_three_screen.dart';
import '../layout/main_layout.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments: ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // 홈스크린으로 데이터 전달
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three',
                arguments: 999); // named는 바로 arguments로 값 전달 가능
          },
          child: Text('Push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              // pushReplacement란, RouteTwoScreen를 RouteThreeScreen로 대체
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
            );
          },
          child: Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
              (route) => route.settings.name == '/',
            ); // '/' 제외 삭제
          },
          child: Text('Push And Remove Until'),
        ),
      ],
    );
  }
}
