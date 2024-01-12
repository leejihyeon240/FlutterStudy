import 'package:flutter/material.dart';

import '../const/tabs.dart';

class AppBarUsingController extends StatefulWidget {
  const AppBarUsingController({super.key});

  @override
  State<AppBarUsingController> createState() => _AppBarUsingControllerState();
}

class _AppBarUsingControllerState extends State<AppBarUsingController>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    // tabController 초기화
    tabController = TabController(length: TABS.length, vsync: this);
    // tabController가 변경될 때마다 addListener 안에 함수가 실행 됨
    // 맨 첫번째 인덱스 일 때, 다음 버튼만 뜨고 두번째 인덱스 일 때는 이전 버튼도 생김
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar Using Controller'),
        bottom: TabBar(
          controller: tabController,
          tabs: TABS
              .map(
                (e) => Tab(
                  icon: Icon(e.icon),
                  child: Text(e.label),
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: TABS
            .map((e) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      e.icon,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (tabController.index != 0) // 에러 방지
                          ElevatedButton(
                            onPressed: () {
                              tabController.animateTo(tabController.index - 1);
                            },
                            child: Text('이전'),
                          ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        if (tabController.index != TABS.length - 1)
                          ElevatedButton(
                            onPressed: () {
                              tabController.animateTo(tabController.index + 1);
                            },
                            child: Text('다음'),
                          ),
                      ],
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
