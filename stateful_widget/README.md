# stateful_widget

위젯이란, 모두 “불변”의 법칙을 갖고 있음
하지만 변경해야할 때가 있음 (ex. 색 변경 등)
--> 기존 위젯을 삭제하고 새로운 것으로 대체되는 것임 (ex. 빨강 -> 파랑)

StatelessWidget은 라이프 사이클동안 단 한번만 빌드 됨

### StatefulWidget은 우리가 상태를 관리할 수 있다는 것
1) 상태를 관리하려면 여러번 빌드 함수를 부를 수 있어야 함
### 2) 그래서 State랑 같이 사용함


StatefulWidget
1) Constructor
2) createState (*State 만들기)

State —> dispose 많이 사용

### i) 파라미터가 바뀔 때 -> 기존 위젯 삭제되고 새로운 위젯 만들어지지만, State는 재활용 함
<img width="910" alt="파라미터가 변경되었을 때" src="https://github.com/leejihyeon240/FlutterStudy/assets/59243729/64e1e77f-939f-4ecd-be54-b82e4abd206a">

### ii) setState는 State 안에서 사용 가능
### State 내부에서 자체적으로 빌드 재실행(변수 변경 가능) -> 많이 사용할 예정
<img width="896" alt="스크린샷 2023-08-03 오후 7 41 58" src="https://github.com/leejihyeon240/FlutterStudy/assets/59243729/e4081130-9893-45e5-a970-c1efecc90dfd">
