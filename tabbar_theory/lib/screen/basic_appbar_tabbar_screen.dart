import 'package:flutter/material.dart';

import '../const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
            title: Text('BasicAppBarScreen'),
            bottom: PreferredSize(
                // 꼼수
                preferredSize: Size.fromHeight(80),
                child: Row(
                  // 꼼수를 써서 탭바 안을 더 자유롭게 설정할 수 있음
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabBar(
                      indicatorColor: Colors.red,
                      indicatorWeight: 4.0,
                      // 탭 전체 사이즈 만큼 구분선
                      indicatorSize: TabBarIndicatorSize.tab,
                      // indicatorSize: TabBarIndicatorSize.label, 라벨 사이즈 만큼 탭 아래 구분선 크기
                      isScrollable: true, // 탭 스크롤
                      labelColor: Colors.yellow, // 레이블 컬러
                      unselectedLabelColor: Colors.black, // 선택되지 않은 레이블 컬러
                      labelStyle: TextStyle(
                          // 선택된 레이블 스타일
                          fontWeight: FontWeight.w700),
                      unselectedLabelStyle: TextStyle(
                          // 선택되지 않은 레이블 스타일
                          fontWeight: FontWeight.w100),
                      tabs: TABS
                          .map((e) => Tab(
                                icon: Icon(e.icon),
                                child: Text(e.label),
                              ))
                          .toList(),
                    ),
                  ],
                ))),
        body: TabBarView(
          physics:
              const NeverScrollableScrollPhysics(), // 옆으로 스크롤 밀어서 이동 제한(이거 난 좋은데 왜 제한)
          children: TABS
              .map((e) => Center(
                    child: Icon(
                      e.icon,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
