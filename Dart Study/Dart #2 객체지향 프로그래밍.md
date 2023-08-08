### CODE 1
```
void main(){ 
  
  // 방법 1
  // 아무리 값이 같더라도, 인스턴스는 각각으로 구분 된다
  // 하지만 const를 붙인다면 같은 인스턴스 취급이 가능
  Idol blackPink = Idol(
  '블랙핑크',
  ['지수', '제니', '리사', '로제']);

  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();

  // 방법 2
  Idol bts = Idol.fromList(
  [
    ['RM', '진', '슈가', '제이홉', '지민', '뷔', '정국'],
    'BTS',
  ]
);

  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();

}

// Idol class
// name (이름) - 변수
// mambers (멤버들) - 변수
// sayHello (인사) - 함수
// introduce (멤버소개) - 함수

// constructor (생성자)

// this는 현재 클래스를 말함
// this.name은 현재 클래스에 선언한 name 변수를 쓰겠다는 말

// immutable 프로그래밍  : 한번 값을 설정하면 변경할 수 없도록 하는 것
// final or const 키워드(한번 설정하면 못 바꾸게 하는 키워드)를 사용하는 것

class Idol {
  String name;
  List<String> members;
  
  // 기본 생성자
  Idol(this.name, this.members);
  
  // named 생성자
  Idol.fromList(List values)
    : this.members = values[0],
      this.name = values[1];
  
  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }
  
  void introduce() {
    print('저희 멤버는 ${this.members}가 있습니다.');
  }
  
}
```
<br>

### CODE 2

```
void main(){ 
  
  Idol blackPink = Idol(
  '블랙핑크',
  ['지수', '제니', '리사', '로제']);

  Idol bts = Idol.fromList(
  [
    ['RM', '진', '슈가', '제이홉', '지민', '뷔', '정국'],
    'BTS',
  ]
);

  print(blackPink.firstMember);
  print(bts.firstMember);

  blackPink.firstMember = 'codeFactory';
  bts.firstMember = 'iron man';
  
  print(blackPink.firstMember);
  print(bts.firstMember);

}

// getter / setter
// 데이터를 가져올 때 / 데이터를 생성할 때

class Idol {
  String name;
  List<String> members;
  
  // 기본 생성자
  Idol(this.name, this.members);
  
  // named 생성자
  Idol.fromList(List values)
    : this.members = values[0],
      this.name = values[1];
  
  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }
  
  void introduce() {
    print('저희 멤버는 ${this.members}가 있습니다.');
  }
  
  // getter
  String get firstMember{
    return this.members[0];
  }
  
  // setter
  set firstMember(String name){
    this.members[0] = name;
  }
  
}
```

<br>

### CODE 3

```
void main(){ 
  
  // Private 속성 --> _어쩌고
  // 다른 파일에서 불러와다가 쓸 수 없다
  // 같은 파일에서만 사용할 수 있다
  
  _Idol blackPink = _Idol(
  '블랙핑크',
  ['지수', '제니', '리사', '로제']);

  _Idol bts = _Idol.fromList(
  [
    ['RM', '진', '슈가', '제이홉', '지민', '뷔', '정국'],
    'BTS',
  ]
);

  print(blackPink.firstMember);
  print(bts.firstMember);

  blackPink.firstMember = 'codeFactory';
  bts.firstMember = 'iron man';
  
  print(blackPink.firstMember);
  print(bts.firstMember);

}

// getter / setter
// 데이터를 가져올 때 / 데이터를 생성할 때

class _Idol {
  String name;
  List<String> members;
  
  // 기본 생성자
  _Idol(this.name, this.members);
  
  // named 생성자
  _Idol.fromList(List values)
    : this.members = values[0],
      this.name = values[1];
  
  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }
  
  void introduce() {
    print('저희 멤버는 ${this.members}가 있습니다.');
  }
  
  // getter
  String get firstMember{
    return this.members[0];
  }
  
  // setter
  set firstMember(String name){
    this.members[0] = name;
  }
  
}
```

<br>

### CODE 4

```
void main(){ 
  print('-----Idol-----');
  Idol apink = Idol(name: '에이핑크', membersCount: 5);
  
  apink.sayName();
  apink.sayMembersCount();
  
  print('-----BoyGroup-----');
  BoyGroup bts = BoyGroup('bts', 5);
  
  bts.sayName();
  bts.sayMembersCount();
  bts.sayMale();
  
  print('-----GirlGroup-----');
  GirlGroup redVelvet = GirlGroup('bts', 5);
  
  redVelvet.sayName();
  redVelvet.sayMembersCount();
  redVelvet.sayMale();
  
  print('-----Type Comparison-----');
  print(apink is Idol); // true
  print(apink is BoyGroup); // false
  print(apink is GirlGroup); // false
  
}

// 상속 - inheritance
// 상속을 받으면 부모 클래스의 모든 속성을 자식 클래스가 부여받음
// 부모 클래스는 자식 클래스를 절대 상속 받을 수 없음

class Idol {
  // 이름
  String name;
  // 멤버 숫자
  int membersCount;
  
  Idol({
    required this.name,
    required this.membersCount,
  });
  
  void sayName() {
    print('저는 ${this.name}입니다.');
  }
  
  void sayMembersCount() {
    print('${this.name}은 ${this.membersCount}명의 멤버가 있습니다.');
  }
}

class BoyGroup extends Idol {
  BoyGroup(
  String name,
  int membersCount,
    ) : super(
            name: name,
            membersCount: membersCount,
  );
  
  void sayMale() {
    print('저는 남자 아이돌입니다.');
  }
}

class GirlGroup extends Idol {
  GirlGroup(
  String name,
  int membersCount,
    ) : super(
            name: name,
            membersCount: membersCount,
  );
  
  void sayMale() {
    print('저는 여자 아이돌입니다.');
  }
}
```

<br>

### CODE 5

```
void main() {
  TimesTwo tt = TimesTwo(2);

  print(tt.calculate());

  TimesFour tf = TimesFour(2);

  print(tf.calculate());
}

// method - function (class 내부에 있는 함수)
// override - 덮어쓰다 (우선시하다)

class TimesTwo {
  final int number;

  TimesTwo(
    this.number,
  );

  // method
  int calculate() {
    return number * 2;
  }
}

class TimesFour extends TimesTwo {
  TimesFour(
    int number,
  ) : super(number);

  @override
  int calculate() {
    return super.calculate() * 2;
  }
}
```

<br>

### CODE 6

```
void main() {
  Employee a = Employee('a');
  Employee b = Employee('b');
  Employee c = Employee('c');
  
  a.name = '코드팩토리';
  // Instance에 귀속된다는 것은, 이렇게 인스턴스를 만든 후에 값을 바꿀 수 있다는 것
  a.printNameAndBuilding();
  b.printNameAndBuilding();
  
  // class에 귀속된다는 것은, 바로 클래스에 .으로 붙어서 실행하거나 값을 바꿀 수 있는 것
  Employee.building = 'tower';
  
  a.printNameAndBuilding();
  b.printNameAndBuilding();
  
  Employee.printBuilding();
}

class Employee {
  // static은 instance에 귀속되지 않고 class에 귀속된다.
  // 알바생이 일하고 있는 건물
  static String? building;
  // 알바생 이름
  String name;
  
  Employee(
  this.name,
  );
  
  void printNameAndBuilding(){
    print('제 이름은 $name입니다. $building 건물에서 근무하고 있습니다.');
  }
  
  static void printBuilding(){
    print('저는 $building 건물에서 근무하고 있습니다.');
  }
  
}
```

<br>

### CODE 7

```
void main() {
  BoyGroup bts = BoyGroup('BTS');
  GirlGroup redVelvet = GirlGroup('redVelvet');

  bts.sayName();
  redVelvet.sayName();
  
  print(bts is IdolInterface);
  print(bts is BoyGroup);
  print(bts is GirlGroup);

}

// interface
// 특수한 구조를 강제하는 것

// abstract를 사용하여 인터페이스화 하지말라는 것
abstract class IdolInterface {
  String name;

  IdolInterface(this.name);

  void sayName() {}
}

class BoyGroup implements IdolInterface {
  String name;

  BoyGroup(this.name);

  void sayName() {
    print('제 이름은 $name 입니다.');
  }
}

class GirlGroup implements IdolInterface {
  String name;

  GirlGroup(this.name);

  void sayName() {
    print('제 이름은 $name 입니다.');
  }
}
```

<br>

### CODE 8

```
void main() {

  Lecture<String, String> lecture1 = Lecture('123', 'lecture1');
  
  lecture1.printIdType();
  
  Lecture<int, String> lecture2 = Lecture(123, 'lecture1');
  
  lecture2.printIdType();
  
}

// generic - **타입을 외부에서 받을 때 사용
class Lecture<T, X> {
  final T id;
  final X name;
  
  Lecture(this.id, this.name);
  
  void printIdType(){
    print(id.runtimeType);
  }
}
```
