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
<br>

### CODE 14

```
void main() {
  
  // Map
  // Key / Value 이렇게 짝을 지어야함
  
  Map<String, String> dictionary = {
    'Harry Potter' : '해리포터',
    'Ron Weasley' : '론 위즐리' // Map은 항상 Key를 이용하여 Value 값을 찾음
  };
  
  print(dictionary);
  
  Map<String, bool> isHarryPotter = {
    'Harry Potter' : true,
    'Ron Weasley' : true,
    'Iron Man' : false,// Map은 항상 Key를 이용하여 Value 값을 찾음
  };
  
  print(isHarryPotter);
  
  // Map<타입, 타입> --> 타입을 마음대로 지정할 수 있음
  // ** 타입에 맞는 값을 넣어줘야함
  
  // addAll() 함수
  isHarryPotter.addAll({ // map에 값을 추가하는 방법
    'Spider Man' : false,
  });
  
  print(isHarryPotter); 
  
  // 원하는 key에 해당하는 값 가져오기
  // ** value에 해당하는 값을 못 가져옴, 무조건 key에 해당하는 값
  print(isHarryPotter['Iron Man']);
  
  // 임의적으로 값을 추가하는 방법
  isHarryPotter['Hulk'] = false;
  print(isHarryPotter); 
  
  // 위에 방식 추가 예시
  // 갑자기 스파이더맨이 출연한다고 해서 false에서 true로 값을 바꾸는 법
  isHarryPotter['Spider Man'] = true;
  print(isHarryPotter); 

  // remove() 함수 : 값 지우기
  isHarryPotter.remove('Harry Potter');
  print(isHarryPotter); 
  
  // key값만 받는 법
  print(isHarryPotter.keys); 
  
  // values값만 받는 법
  print(isHarryPotter.values); 


}
```

<br>

### CODE 15

```
void main() {
  
  // Set : 자동으로 중복 처리해줌, 같은 값 못 씀
  final Set<String> names = {
    'a',
    'b',
    'c',
    'c'
  };
  
  print(names);
  
  // 새로운 값 넣기
  names.add('jenny');
  print(names);

  // 기존 값 지우기
  names.remove('jenny');
  print(names);

  // 다음 값이 존재하는 지
  print(names.contains('jennt'));
}
```

<br>

### CODE 16

```
void main() {
  
  // if문
  
  int number = 2;
  
  // if(조건) - else if(조건) - else
  if(number % 3 == 0){ // (조건) --> 짝수
    print('나머지가 0입니다.');
  } else if(number % 3 == 1) {
    print('나머지가 1입니다.');
  } else {
    print('나머지가 2입니다');
  }
  
  // switch문
  
  int number2 = 1;
  
  switch(number2 % 3){
    case 0:
      print('나머지가 0입니다.');
      break;
      
    case 1:
      print('나머지가 1입니다.');
      break;
      
    // default == (if문의)else
    default:
      print('나머지가 2입니다.');
      break;
  }
  
  // for loop : 반복적인 문제를 해결할 때 쓰기 좋음
  for(int i = 0; i < 10; i++){
    print(i);
  }
  
  // 1번 방법 : i를 인덱스로 사용
  int total = 0;
  
  List<int> numbers = [1, 2, 3, 4, 5, 6];
  
  for(int i = 0; i < numbers.length; i++){
    total += numbers[i];
  }
  
  print(total);
  
  // 2번 방법 : for in loop
  
  total = 0;
  
  // in의 오른쪽에 있는 값들이 왼쪽에 하나씩 들어감
  for(int number in numbers){
    print(number);
    total += number;
  }
  
  print(total);

  // while loop
  
  total = 0;
  
  while(total < 10){
    total += 1;
  }
  
  print(total);
  
  // do while문 --> 거의 안 씀
  
  total = 0;
  
  do {
    total += 1;
  } while(total < 10);
  
  print(total);
  
  // while과 break

  total = 0;
  
  while(total < 10){
    total += 1;
    
    if(total == 5){
      break;
    }
  }
  
  print(total);
  
  // for와 break
  
  total = 0;
  
  for(int i = 0; i < 10; i++){
    total += 1;
    if(total == 5){
      break;
    }
  }
  
 print(total);

  // continue = 현재 조건만 스킵하라는 뜻
  for(int i = 0; i < 10; i++){
    if(i == 5){ // 5만 안 찍힘
      continue; // 현재 loop를 종료하시오
    }
    print(i);
  }
  
}
```

<br>

### CODE 17

```
// enum을 사용하는 이유
// 정확히 이 3개의 값밖에 존재하지 않는 다는 걸, 다른 개발자와 미래의 나에게 알려줄 수 있음
// 또는 오타 발견 가능
// 그 타입만 사용할 수 있도록 강제할 수 있음

enum Status { 
  approved, // 승인
  pending, // 대기
  rejected, // 거절
}

void main() {
  Status status = Status.pending;
  
  if(status == Status.approved){
    print('승인입니다.');
  }else if(status == Status.pending){
    print('대기입니다.');
  }else{
    print('거절입니다.');
  }
}
```
<br>

### CODE 18

```
//void = 공허라는 뜻
void main() { // main 함수는 자동으로 실행되는 함수
  addNumbers(y: 20, x: 10);
  
  addNumbers(x: 10, y: 30, z: 40);
}

// 세개의 숫자 (x,y,z)를 더하고 짝수인지 홀수인지 알려주는 함수
// parameter / argument - 매개변수

// positional parameter - 순서가 중요한 파라미터

// optional patameter - 있어도 되고 없어도 되는 파라미터, **[] 대괄호를 넣어주면 됨
// int에서 null을 넣으려면 int? 이렇게 물음표를 붙여줘야함
// []를 고정값으로 하고 싶으면 int y = 20 이런 식으로 해주면 됨

// named parameter - 이름이 있는 파라미터 (순서가 중요하지 않다.)
// required로 이름을 정해주고, 함수 호출할 때 x : ~ 이렇게 값 넣어줘야함
// 그럼 named에서는 optional 파라미터 못 하냐? ㄴㄴ 가능
// required 안 해주고 값 지정해주면 됨

addNumbers({
  required int x,
  required int y,
  int z = 30,
}) { // 외부에서 받은 x, y, z
  int sum = x + y + z;
  
  print('x : $x');
  print('y : $y');
  print('z : $z');
  
  if (sum % 2 == 0) {
    print('짝수입니다.');
  } else {
    print('홀수입니다.');
  }
}
```
<br>

### CODE 19

```
void main(){ 
  int result = addNumbers(10, y: 20);
  
  int result2 = addNumbers(10, y: 30, z: 40);
  
  print('result : $result');
  print('result2 : $result2');
  
  print('sum : ${result + result2}');
}

// arrow function - 화살표 함수

int addNumbers(int x, {
  required int y,
  int z = 30,
}) => x + y + z; // 화살표 옆에 오는 값들이 반환되는 값들임
```

<br>

### CODE 20

```
void main(){ 
  Operation operation = add;
  
  int result = operation(10, 20, 30);
  
  print(result);
  
  operation = subtract;
  
  int result2 = operation(10, 20, 30);
  
  print(result2);
  
  int result3 = calculate(10, 20, 30, add);
  
  print(result3);
  
  int result4 = calculate(10, 20, 30, subtract);
  
  print(result4);
}

// signature
typedef Operation = int Function(int x, int y, int z);

// 더하기
int add(int x, int y, int z) => x + y + z;

// 빼기
int subtract(int x, int y, int z) => x - y - z;

// 계산
int calculate(int x, int y, int z, Operation operation){
  return operation(x, y, z);
}
```

<br>

