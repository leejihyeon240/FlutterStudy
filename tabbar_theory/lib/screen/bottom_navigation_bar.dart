import 'package:flutter/material.dart';

import '../const/tabs.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: TABS.length, vsync: this);
    controller.addListener(() { // 이걸 추가해줘야 누를 때마다 선택된 아이콘으로 변경 됨
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar'),
      ),
      body: TabBarView(
        controller: controller,
        children: TABS
            .map((e) => Center(
                  child: Icon(
                    e.icon,
                  ),
                ))
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true, // 선택된 것의 레이블을 보이도록
          showUnselectedLabels: true, // 선택되지 않은 것의 레이블도 보이도록
          currentIndex: controller.index,
          type: BottomNavigationBarType.fixed, // 아이콘을 눌렀을 때 확대가 되지 않도록
          // shifting = 확대
          onTap: (index) {
            controller.animateTo(index);
          },
          items: TABS
              .map(
                (e) => BottomNavigationBarItem(
                  icon: Icon(e.icon),
                  label: e.label,
                ),
              )
              .toList()),
    );
  }
}
