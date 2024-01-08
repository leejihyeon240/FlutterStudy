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
          bottom: TabBar(
            tabs: TABS
                .map((e) => Tab(
                      icon: Icon(e.icon),
                      child: Text(e.label),
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(), // 옆으로 스크롤 밀어서 이동 제한(이거 난 좋은데 왜 제한)
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
