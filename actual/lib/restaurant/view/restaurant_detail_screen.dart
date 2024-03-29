import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

import '../../product/component/product_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '불타는 떡볶이',
      child: Column(
        children: [
          RestaurantCard(
            image: Image.asset('asset/img/food/ddeok_bok_gi.jpg',
                fit: BoxFit.cover),
            name: '불타는 떡볶이',
            tags: ['떡볶이', '치즈', '매운맛'],
            ratingsCount: 100,
            deliveryTime: 15,
            deliveryFee: 2000,
            ratings: 4.52,
            isDetail: true,
            detail: '맛있는 떡볶이',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ProductCard(),
          ),
        ],
      ),
    );
  }
}
