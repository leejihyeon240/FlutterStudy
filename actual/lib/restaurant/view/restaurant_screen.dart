import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/const/data.dart';
import '../component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  // async로 함수를 선언했기 때문에 Future로 반환
  // 왜 async로 선언했냐? --> http 요청 할 거잖아
  Future<List> paginateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(headers: {
        // accessToken 추가
        'authorization': 'Bearer $accessToken',
      }),
    );

    // data 라는 키 안의 값들만 가져옴
    // 우리가 원하는 것은 data '키' 안에 있는 리스트 값!
    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List>(
            // 비동기 처리, 결과에 따라 UI 업데이트
            future: paginateRestaurant(),
            // AsyncSnapshot 클래스는 Future의 결과와 에러 정보를 저장하며, Snapshot의 모든 상태를 포함
            // Snapshot은 FutureBuilder에서 Future의 현재 상태를 나타내는데 사용되며, AsyncSnapshot은 Snapshot의 하위 클래스로서 Future의 결과와 에러 정보를 저장하는데 사용
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              return ListView.separated(
                // snapshot.data 안에는 각각의 레스토랑 정보가 들어있다링
                itemCount: snapshot.data!.length, // 리스트뷰로 구현 해주기 위해 카운트!
                itemBuilder: (_, index) {
                  final item = snapshot.data![index]; // index를 통해 각각의 레스토랑 정보 가져옴
                  // item --> [~,~,~]

                  return RestaurantCard(
                    image: Image.network(
                      'http://$ip${item['thumbUrl']}',
                      fit: BoxFit.cover,
                    ),
                    name: item['name'],
                    // 타입 오류 해결 "다이나믹 --> String"
                    // 정의할 때 string된 리스트로 설정 해놨기 때문에
                    tags: List<String>.from(item['tags']),
                    ratingsCount: item['ratingsCount'],
                    deliveryTime: item['deliveryTime'],
                    deliveryFee: item['deliveryFee'],
                    ratings: item['ratings'],
                  );
                },
                separatorBuilder: (_, index) {
                  return SizedBox(height: 16.0);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
