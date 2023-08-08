### CODE 1
```
void main() {

  List<String> blackPink = ['로제', '지수', '리사', '제니', '제니'];
  
  print(blackPink);
  // asMap - map 형태로 변환
  print(blackPink.asMap());
  // toSet - 자동으로 중복 제거
  print(blackPink.toSet());

  Map blackPinkMap = blackPink.asMap();
  
  print(blackPinkMap.keys.toList());
  print(blackPinkMap.values.toList());
  
  Set blackPinkSet = Set.from(blackPink);
  
  print(blackPinkSet.toList());
}
```
<br>

### CODE 2

```
void main() {

  List<String> blackPink = ['로제', '지수', '리사', '제니', '제니'];
  
  // 하나의 형태를 map()을 사용해서 **아예 새로운 형태로
  final newBlackPink = blackPink.map((x) {
    return '블랙핑크 $x';
  });
  
  print(blackPink);
  print(newBlackPink.toList());

  // arrow 함수로도 가능
  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
  print(newBlackPink2.toList());
  
  print(blackPink == blackPink);
  print(newBlackPink == blackPink);
  print(newBlackPink2 == blackPink);
  
  // [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg]
  String number = '13579';
  
  final parsed = number.split('').map((x) => '$x.jpg').toList();
  
  print(parsed);
  
}
```

<br>

### CODE 3

```
void main() {

 Set blackPinkSet = {
   '로제',
   '지수',
   '제니',
   '리사',
 };
  
 // set도 Map을 통해서 변경할 수 있음
  final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toSet();
  
  print(newSet);
}
```

<br>

### CODE 4

```
void main() {
  List<Map<String, String>> people = [
    {
      'name': '로제',
      'group': '블랙핑크',
    },
    {
      'name': '지수',
      'group': '블랙핑크',
    },
    {
      'name': '알엠',
      'group': '방탄',
    },
    {
      'name': '뷔',
      'group': '방탄',
    },
  ];

  print(people);

  // where는 T/F를 반환하여 true만 필터링 해줌
  final blackPink = people.where((x) => x['group'] == '블랙핑크').toList();

  print(blackPink);
}
```

<br>

### CODE 5

```
void main() {
  
  // reduce 함수
  // 처음에만 리스트의 첫번쩨, 두번째 값이 들어감
  // 그 다음부턴 total 값이 이전이 되고, 세번째 값이 next
  
  List<int> numbers = [
    1,
    3,
    5,
    7,
    9
  ];
  
  final result = numbers.reduce((prev, next){
    print('--------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');
    
    return prev + next;
  });
  
  final result2 = numbers.reduce((prev, next) => prev + next);
  
  print(result);
  print(result2);
  
}
```

<br>

### CODE 6

```
void main() {
 // <리턴되는 타입과 같아야 함>
 List<int> numbers = [
    1,
    3,
    5,
    7,
    9
  ];
  
  final result = numbers.reduce((prev, next) => prev + next);
  
  print(result);
  
  // reduce()로 글자 더하기
  List<String> words = [
    '안',
    '녕',
    '클레오파트라',
  ];
  
  final sentence = words.reduce((prev, next) => prev + next);
  
  print(sentence);
}
```

<br>

### CODE 7

```
void main() {

 List<int> numbers = [
    1,
    3,
    5,
    7,
    9
  ];
  
  // fold
  // fold는 <>(제너릭)을 사용해서 반환값 지정 해줘야 함
  // fold의 장점은 아무 형태나 리턴을 해줄 수 있음
  final sum = numbers.fold<int>(0, (prev, next){
    print('--------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');
    
    return prev + next;
  });
  
  print(sum);
}
```

<br>

### CODE 8

```
void main() {

 List<String> words = [
    '안',
    '녕',
    '클레오파트라',
  ];
  
  final sentence = words.fold<String>('', (prev, next) => prev + next);
  
  print(sentence);
  
  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  
  print(count);
}
```

<br>

### CODE 9

```
void main() {

  // cascadig operator
  // ...
  // 리스트 안에 값들을 풀어넣는 역할
  
  List<int> even = [
    2,
    4,
    6,
    8,
  ];
  
  List<int> odd = [
    1,
    3,
    5,
    7,
  ];
  
  print([even, odd]); // [[2, 4, 6, 8], [1, 3, 5, 7]]
  print([...even, ...odd]); // [2, 4, 6, 8, 1, 3, 5, 7] **새로운 리스트
}
```

<br>

### CODE 10

```
void main() {
  // 함수형 프로그래밍은 실행하는 대상의 List나 map과 완전히 다른 새로운 값 생성 가능(?뭔소리지)
  // 여러개의 함수를 체이닝(묶는?)하여 새로운 형태의 값을 만들 수 있음
  // 주의 : 코드가 간결하기 때문에 너무 심취해서 많이 연동해버리면 협업하기 힘듦
  // 코멘트를 남기는 습관을 키우는 것이 좋음

  List<Map<String, String>> people = [
    {
      'name': '로제',
      'group': '블랙핑크',
    },
    {
      'name': '지수',
      'group': '블랙핑크',
    },
    {
      'name': '알엠',
      'group': '방탄',
    },
    {
      'name': '뷔',
      'group': '방탄',
    },
  ];

  print(people);

  // ! --> 값을 증명한다는 표시
  final parsedPeople = people
      .map(
        (x) => Person(
          name: x['name']!,
          group: x['group']!,
        ),
      )
      .toList();

  print(parsedPeople);
  // [Person(name:로제, group:블랙핑크), Person(name:지수, group:블랙핑크), Person(name:알엠, group:방탄), Person(name:뷔, group:방탄)]

  final bts = parsedPeople.where(
    (x) => x.group == '방탄',
  );
  
  print(bts);

  final result = people
      .map(
        (x) => Person(
          name: x['name']!,
          group: x['group']!,
        ),
      )
      .where((x) => x.group == '방탄')
      .fold<int>(
        0,
        (prev, next) => prev + next.name.length,
      );

  print(result);
}

// 신뢰성을 위해 데이터를 가져왔을 때 class 형태(구조화)로 변환해서 사용함
// 오류를 줄일 수 있음, 사용성이 좋음
class Person {
  final String name;
  final String group;

  Person({
    required this.name,
    required this.group,
  });

  @override
  String toString() {
    return 'Person(name:$name, group:$group)';
  }
}
```

<br>


