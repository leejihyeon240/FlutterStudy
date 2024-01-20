import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    required this.onChanged,
    // 기본 값은 false로
    this.autofocus = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 따로 텍스트 필드 테두리 설정
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      // 비밀번호 입력할때
      obscureText: obscureText,
      // 자동으로 포커스를 맞춤
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        // 텍스트 필드 안에서 패딩을 줄 때
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        // 에러가 있을 때, 아래에 뜨는 것(이걸 왜 이제 알았지...)
        errorText: errorText,
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        // fillColor filled는 세트
        // 필드 배경 칼라 설정
        fillColor: INPUT_BG_COLOR,
        // false - 배경색 없음
        // true - 배경색 있음
        filled: true,
        // 모든 Input 상태의 기본 스타일 세팅
        border: baseBorder,
        enabledBorder: baseBorder,
        // 선택 됐을 때 테두리
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
