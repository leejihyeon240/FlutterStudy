import 'package:flutter/material.dart';
import 'package:row_and_column/const/colors.dart';

class MainAxisAlignmentScreen extends StatelessWidget {
  const MainAxisAlignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          // Row랑 Column 모두 구현
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
