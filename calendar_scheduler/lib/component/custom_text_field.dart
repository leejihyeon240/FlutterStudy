import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  // true - 시간 / false - 내용
  final bool isTime;
  final FormFieldSetter<String> onSaved;

  const CustomTextField({
    required this.isTime,
    required this.label,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (isTime) renderTextField(),
        if (!isTime)
          Expanded(
            child: renderTextField(),
          ),
      ],
    );
  }

  Widget renderTextField() {
    // 너무 유용한데 어렵지만 할 수 있다
    return TextFormField(
      onSaved: onSaved,
      // Form : 동시에 텍스트 필드를 통합관리하기 적합함
      // 텍스트 필드 밑에 안내 문자로 뜸
      validator: (String? val) {
        if (val == null || val.isEmpty) { // 조건에 맞지 않으면 에러(관리해주고 있음), 공통 관리
          return '값을 입력해주세요';
        }
        if(isTime){
          int time = int.parse(val); // int 값으로 변환

          if(time < 0){
            return '0 이상의 숫자를 입력해주세요';
          }

          if(time > 24){
            return '24 이하의 숫자를 입력해주세요';
          }
        }else{
          if(val.length > 500){
            return '500자 이하의 글자를 입력해주세요.';
          }
        }
        return null;
      },
      cursorColor: Colors.grey,
      maxLines: isTime ? 1 : null, // maxLines : 줄바꿈
      expands: !isTime, // 어렵다 뭐냐
      maxLength: 500, // 이거 뭐냐 쩐다...
      keyboardType: isTime
          ? TextInputType.number
          : TextInputType.multiline, // 숫자 키보드 설정하는 법
      inputFormatters: isTime
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
