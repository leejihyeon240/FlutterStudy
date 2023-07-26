import 'package:flutter/material.dart';
import 'package:row_and_column/const/colors.dart';

class CrossAxisAlignmentScreen extends StatelessWidget {
  const CrossAxisAlignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          // Row와 Column 모두 해보기
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 반대축 정렬
            // start - 시작
            // end - 끝
            // center - 가운데
            // stretch - 최대한으로 늘린다
            children: colors.map(
                  (e) => Container(
                color: e,
                height: 50.0,
                width: 50.0,
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}

