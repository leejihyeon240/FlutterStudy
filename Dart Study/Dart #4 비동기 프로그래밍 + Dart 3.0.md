### CODE 1
```
void main() async{
  
  // Future - 미래
  // 미래에 받아올 값
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTure = Future.value(true);
                                     
  // await -> 순서대로 논리적으로 진행될 수 있도록 해주는 키워드
  // await와 async는 한쌍
  // 지금 코드가 끝나기 전에, 다음 코드를 실행하지마라
  // 근데 이전 코드는 실행해도 됨
                                     
  final result1 = await addNumbers(1, 1);
  final result2 = await addNumbers(2, 2);

  print('result1: $result1');
  print('result2: $result2');
  print('result1 + result2 = ${result1 + result2}');
}

Future<int> addNumbers(int number1, int number2) async {
  print('계산 시작 : $number1 + $number2');
  
  //서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2), (){
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });
  
  print('함수 완료 : $number1 + $number2');
  
  return number1 + number2;
}
```
<br>

### CODE 2

```
import 'dart:async';

void main(){
  
  // Stream - 데이터가 계속 흐름
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();
  
  final streamListener1 = stream.where((val) => val %2 == 0).listen((val){
    print('Listener 1 : $val');
  });
  
  final streamListener2 = stream.where((val) => val %2 == 1).listen((val){
    print('Listener 2 : $val');
  });
  
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}
```

<br>

### CODE 3

```
import 'dart:async';

void main(){
  
  playAllStream().listen((val){
    print(val);
  });
}

  
  // yield* 값을 다 가져올 때까지 기다림
Stream<int> playAllStream()async*{
  yield* calculate(1);
  yield* calculate(1000);
}

Stream<int> calculate(int number) async* {
  for(int i = 0; i < 5; i++){
    yield i * number;
    
    await Future.delayed(Duration(seconds: 1));
  }
}
```
