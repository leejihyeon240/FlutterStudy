import 'package:calendar_scheduler/component/calendar.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focuseDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(), // 플로팅 버튼
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              selectedDay: selectedDay,
              focuseDay: focuseDay,
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 8.0),
            TodayBanner(selectedDay: selectedDay, scheduleCount: 3),
            SizedBox(
              height: 8.0,
            ),
            _ScheduleList(),
          ],
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      // StatefulWidget이어야 setState 사용 가능
      this.selectedDay = selectedDay;
      this.focuseDay = selectedDay; // 선택된 날짜 상태 업데이트
    });
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton( // 플로팅 버튼
      onPressed: () {
        showModalBottomSheet( // 밑에서 올라오는 시트(너무 유용!!), showModalBottomSheet 자체가 원래 화면 반만 차지하도록 되어있음
          context: context,
          isScrollControlled: true, // 그래서 이거 해주면 됨
          builder: (_) {
            return ScheduleBottomSheet(
              selectedDate: selectedDay,
            );
          },
        );
      },
      backgroundColor: PRIMARY_COLOR,
      child: Icon(
        Icons.add,
      ),
    );
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: StreamBuilder<Object>(
          stream: GetIt.I<LocalDatabase>().watchSchedules(),
          builder: (context, snapshot) {
            return ListView.separated(
              // 좋구만유?
              itemCount: 3,
              separatorBuilder: (context, index) {
                // 리스트 사이에 간격 넣어줄 때 사용
                return SizedBox(height: 8.0);
              },
              itemBuilder: (context, index) {
                return ScheduleCard(
                    startTime: 8,
                    endTime: 9,
                    content: '프로그래밍 공부하기',
                    color: Colors.red);
              },
            );
          }
        ),
      ),
    );
  }
}
