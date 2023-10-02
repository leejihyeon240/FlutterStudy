import 'package:calendar_scheduler/component/calendar.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:calendar_scheduler/model/schedule_with_color.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc( // utc 기준으로 시간이 설정되도록 하기(안 하면 앱 제거 후 새로 하면 버그 생김)
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
            TodayBanner(selectedDay: selectedDay),
            SizedBox(
              height: 8.0,
            ),
            _ScheduleList(
              selectedDate: selectedDay,
            ),
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
  final DateTime selectedDate;

  const _ScheduleList({required this.selectedDate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: StreamBuilder<List<ScheduleWithColor>>(
          stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(
                child: Text('스케줄이 없습니다.'),
              );
            }
            return ListView.separated(
              // 좋구만유?
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) {
                // 리스트 사이에 간격 넣어줄 때 사용
                return SizedBox(height: 8.0);
              },
              itemBuilder: (context, index) {
                final scheduleWithColor = snapshot.data![index];

                return Dismissible( // 스와이프를 통해 삭제
                  key: ObjectKey(scheduleWithColor.schedule.id), // key 값이 어떤 위젯이 삭제 됐는지 인식을 함(유니크한 key를 넣어줘야함 :id)
                  direction: DismissDirection.endToStart, // 방향(오른쪽에서 왼쪽)
                  onDismissed: (DismissDirection direction){ // 삭제 이벤트(db에서도 삭제되도록)
                    GetIt.I<LocalDatabase>().removeSchedule(scheduleWithColor.schedule.id);
                  },
                  child: GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) {
                          return ScheduleBottomSheet(
                            selectedDate: selectedDate,
                            scheduleId: scheduleWithColor.schedule.id, // 현재 스케줄의 id
                          );
                        },
                      );
                    },
                    child: ScheduleCard(
                      startTime: scheduleWithColor.schedule.startTime,
                      endTime: scheduleWithColor.schedule.endTime,
                      content: scheduleWithColor.schedule.content,
                      color: Color(
                        int.parse('FF${scheduleWithColor.categoryColor.hexCode}',
                            radix: 16),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
