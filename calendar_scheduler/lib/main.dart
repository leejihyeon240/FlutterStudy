import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // runApp 전에 다른 위젯을 쓸 경우, 이렇게 초기화 해줘야 함

  await initializeDateFormatting();

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    ),
  );
}