import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom; // 키보드가 차지하는 높이

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 2 + bottomInset,
      child: Padding( // 패딩을 추가해서 키보드 만큼 공간을 줘야함
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Column(
          children: [
            TextField(),
          ],
        ),
      ),
    );
  }
}
