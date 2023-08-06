### CODE 1
```
void main() {
  
  // 위에서부터 아래로 순서대로 실행 됨
  // 거꾸로는 절대 실행되지 않음
  var name = '코드팩토리';
  
  print(name);
  
  // 값을 바꾸고 싶을 땐 var을 쓰지 않음
  name = '코레';
  
  print(name);
  
  // *선언한 변수의 값을 바꾸는 것은 가능하지만, 똑같은 변수를 또 선언하는 것은 할 수 없음
  
  int number1 = 10;
  int number2 = 15;
  
  print(number1 + number2);
  print(number1 - number2);
  print(number1 / number2);
  print(number1 * number2);
  
  // 실수 double
  double number3 = 2.5;
  double number4 = 0.5;
  
  print(number3 + number4);
  print(number3 - number4);
  print(number3 / number4);
  print(number3 * number4);
  
  // 맞다 or 틀리다 Boolean
  
  bool lsTrue = true;
  bool lsFalse = false;
  
  print(lsTrue);
  print(lsFalse);
  
  // 글자타입 String
  
  String name1 = '와';
  String name2 = '우';

  print(name1);
  print(name2);
  
  // var은 자동으로 오른쪽 값을 보고 타입을 정해주는 것, 자동으로 유츄함
  // print(name3.runtimeType);으로 출력해보면 무슨 타입인지 알려줌
  
  // var과 String을 구별해서 쓰는 이유는 나중에 코드 많아지면 힘듦
  // 왠만하면 직접 명시 해주는 것이 좋음
  
  }
```
<br>

### CODE 2

```
void main() {
  
  // 글자타입 String
  // 덧셈만 가능
  
  String name1 = '이디현';
  String name2 = '입니다';

  print(name1 + name2);
  print(name1 + ' ' + name2);
  
  // ${}를 하면 String 안에 변수 2개 넣을 수 있음
  // {} 괄호 생략도 가능
  // 변수로 인식하는 것
  print('${name1.runtimeType} ${name2}'); // String 입니다
  
  // 오...
  print('$name1.runtimeType $name2'); // 이디현.runtimeType 입니다
  
  }
```

<br>

### CODE 3

```
void main() {
  
  // dynamic은 var과 비슷함
  // 어떤 타입이든 가능
  dynamic name = '코드팩토리';
  
  print(name);
  
  dynamic number = '1';
  
  print(number);
  
  var name2 = '배고프다';
  
  print(name2);
  
  // 차이가 없어 보이죠?
  print(name.runtimeType);
  print(name2.runtimeType);
  
  // dynamic과 var의 차이는 "dynamic은 어떤 타입이든 여러번 변경이 가능하다는 점"
  
  name = 2;
  print(name);
  
  }
```

<br>

### CODE 4

```
void main() {
  
  // nullable - null이 될 수 있다.
  // non-nullable - null이 될 수 없다.
  // null - 아무런 값도 있지 않다.
  
  String name = '코드팩토리';
  
  print(name);
  
  // name = null; 오류!
  
  // 어떤 타입이든 끝에 ?를 넣으면 이것은 null까지 들어갈 수 있는 타입이라는 것
  String? name2 = '블랭';
  
  name2 = null;
  
  print(name2);
  
  // **print(name2!); --> name2는 절대로 null이 아니라는 뜻
  
  }
```

<br>

### CODE 5

```
void main() {
  
  final String name = 'zoo';
  
  print(name);
  
  // name = '블랙핑크'; final로 선언하면 변경 불가
  
  const String name2 = '블랙핑크';
  
  print(name2);
  
  // name = '블랙티비'; const로 선언하면 변경 불가

  // final, const를 쓰면 'var 키워드'를 생략할 수 있음
  // 예시
  final name = 'zoo';
  const name2 = '블랙핑크';
  
  }
```

<br>

### CODE 6

```
void main() {
  
  // print가 될 때의 시간이  찍힘
  DateTime now = DateTime.now();
  
  print(now);
  
  // final은 되는데, "const는 오류 뜸"
  // run을 클릭 시, 빌드라는 과정이 일어남
  // 빌드란, 컴퓨터가 이해할 수 있는 코드로 변환 되는 것
  final DateTime now2 = DateTime.now();
  
   print(now2);
  
  // *final 같은 경우에는 빌드 타임의 값을 몰라도 되지만,
  // *const 같은 경우네는 빌드 타임의 값을 알아야 하기 때문에 오류가 남
  
  }
```
<br>

### CODE 7

```
void main() {
  
  // + - * / --> 사칙연산
  
  int number = 2;
  
  print(number);
  print(number + 2);
  print(number / 2);

  number ++; // + 1 변수 고정값 변함
  print(number);
  
  number --; // - 1
  print(number);
  
  number += 5; // + 5
  print(number);
  
  number -= 3; // - 3
  print(number);
  
  }
```

<br>

### CODE 8

```
void main() {
  
  // null
  
  double? number = 4.0;
  
  print(number);
  
  number = 2.0;
  
  print(number);
  
  number = null;
  
  print(number);
 
  // number가 만약에 null이라면 오른쪽 값으로 바꿔라
  
  number ??= 5.0;
  
  print(number);
  
  }
```

<br>

### CODE 9

```

void main() {
  
  int number1 = 1;
  int number2 = 2;
  
  print(number1 > number2); // false
  print(number1 < number2); // true
  print(number1 >= number2); // false
  print(number1 <= number2); // true
  print(number1 == number2); // false
  print(number1 != number2); // true
  
  }
```

<br>

### CODE 10

```

void main() {
  
  int number1 = 1;
  
  print(number1 is int); // true
  print(number1 is String); // false
  
  print(number1 is! int); // false
  print(number1 is! String); // true
 
  }

```

<br>

### CODE 11

```

void main() {
  
  bool result = 12 > 10 && 1 > 0; // true, 둘 다 true여야 true가 나옴
  print(result);
  
  bool result2 = 12 > 10 && 1 < 0; // false
  print(result2);
 
  bool result3 = 12 > 10 || 1 > 0; // true, 둘 중 하나만 true여도 true
  
  bool result4 = 12 > 10 || 1 < 0; // true
  print(result4);
  
  }

```

<br>

### CODE 12

```
void main() {
  
  // List 리스트
  // <> 제너릭 --> 안에 들어가는 타입으로 리스트를 만들겠다는 것
  List <String> blankPink = ['제니', '지수']; // 스트링 타입의 리시트이기 때문에, 숫자 넣으면 오류남
  print(blankPink);
  
  // index 순서
  // index는 0부터 시작
  
  print(blankPink[0]); // 리스트 안의 "첫 번째 값"을 가지고 오고 싶을 때
 
}
```

<br>

### CODE 13

```
void main() {
  
  // List 리스트
  // <> 제너릭 --> 안에 들어가는 타입으로 리스트를 만들겠다는 것
  List <String> blankPink = ['제니', '지수']; // 스트링 타입의 리시트이기 때문에, 숫자 넣으면 오류남
  print(blankPink.length);
  
  // index 순서
  // index는 0부터 시작
  
  print(blankPink[0]); // 리스트 안의 "첫 번째 값"을 가지고 오고 싶을 때
 
  blankPink.add('코드팩토리'); // 삽입
  blankPink.remove('제니'); // 제거
  print(blankPink);
  
   print(blankPink.indexOf('지수')); // 몇 번째?
}
```
