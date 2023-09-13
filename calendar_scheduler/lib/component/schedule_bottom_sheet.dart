import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset =
        MediaQuery.of(context).viewInsets.bottom; // 키보드가 차지하는 높이

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 2 + bottomInset,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
        child: Padding(
          // 패딩을 추가해서 키보드 만큼 공간을 줘야함
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Time(),
              SizedBox(
                height: 16.0,
              ),
              _Contents(),
              SizedBox(
                height: 16.0,
              ),
              _ColorPicker(),
              SizedBox(
                height: 8.0,
              ),
              _SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextField(
          label: '시작 시간',
        )),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
            child: CustomTextField(
          label: '마감 시간',
        )),
      ],
    );
  }
}

class _Contents extends StatelessWidget {
  const _Contents({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: '내용',
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // Wrap : 줄바꿈이 알아서 됨
      spacing: 8.0,
      runSpacing: 10.0,
      children: [
        renderColor(Colors.red),
        renderColor(Colors.orange),
        renderColor(Colors.yellow),
        renderColor(Colors.green),
        renderColor(Colors.blue),
        renderColor(Colors.indigo),
        renderColor(Colors.purple),
      ],
    );
  }

  Widget renderColor(Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      width: 32.0,
      height: 32.0,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // 버튼 최대로 늘리는 법** Row로 감싸고, Expanded로 한번 더 감싸기!!!(아 너무 유용합니다~!)
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR,
                ),
                child: Text('저장'))),
      ],
    );
  }
}
