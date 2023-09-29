import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../database/drift_database.dart';
import '../model/schedule_with_color.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;

  const TodayBanner({
    required this.selectedDay,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Container(
      color: PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<List<ScheduleWithColor>>(
                stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDay),
                builder: (context, snapshot) {
                  int count = 0;

                  if (snapshot.hasData) {
                    count = snapshot.data!.length;
                  }

                  return Text(
                    '$count개',
                    style: textStyle,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
