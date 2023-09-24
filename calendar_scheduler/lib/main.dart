import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_scheduler/database/drift_database.dart';

const DEFAULT_COLORS = [
  // 빨강
  'F44336',
  // 주황
  'FF9800',
  // 노랑
  'FFEB3B',
  // 초록
  'FCAF50',
  // 파랑
  '2196F3',
  // 남
  '3F51B5',
  // 보라
  '9C27B0',
];

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // runApp 전에 다른 위젯을 쓸 경우, 이렇게 초기화 해줘야 함

  await initializeDateFormatting();

  final database = LocalDatabase(); // 데이터베이스 생성

  final colors = await database.getCategoryColors(); // 데이터베이스 안에 색깔들 가져옴

  if(colors.isEmpty){
    for(String hexCode in DEFAULT_COLORS){ // 색깔이 하나도 없으면 색깔 하나씩 넣어주기
      await database.createCategoryColor(
        CategoryColorsCompanion(
          hexCode: Value(hexCode),
        ),
      );
    }
  }

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    ),
  );
}