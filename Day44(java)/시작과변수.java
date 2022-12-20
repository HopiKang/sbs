

/*
자바에서는 함수의 입력은 어떤 자료형인지, 출력은 어떤 자료형인지 미리 정해줍니다

리턴자료형
printName(파라미터자료형 파라미터){
    함수 동작
    return 리턴값
}
int, double, char, boolean

클래스를 만드는 함수
public class Main{}

메소드 : 클래스 안에 정의된 함수
public static void main{}

main이 항상 중심점이된다

public 접근제어자
static 바로실행가능하게 만들어준다
void 되돌려주는 값이 없다는 뜻

(String[] args) 메소드 안에 전달되는 값
String[] 문자열
args 변수이름

System.out.println("Hello world!");
system : 자바에서 만들어둔 클래스 입력 출력등 시스템에 관련된 기능등을 모아둔 클래스
out : system안에 출력과 관련된 기능을한다
println : 메소드라 부르며 출력을하고 다음줄로 넘겨준다
("Hello world!") : 메소드에 전달해주는 값


변수
int a;
String S;

변수의 타입
정수형 : byte, short, int, log
실수형 : float, double
문자형 : char
논리형 : boolean
자료의 크기에 따라 변수타입을 맞춰줘야한다

1. 대소문자를 구분 한다 studenthi, studentHi
2. 숫자로 시작할 수 없습니다
3. 밑줄(_)과 다리 표시(&) 를 사용할 수는 있지만
&는 주로 자동 생성되는 변수명으로 쓰이고, _는 보통 상수 이름에 쓰인다
4. class, public 같은 예약어는 변수명으로 사용불가하다
5. 변수명은 카멜케이스로 작성 하는 것이 좋다

변수를 선언하는 방법
1. 변수의 선언만 하는 방법
2. 변수의 선언과 동시에 초기화하는 방법

int num1, num2
double num3 = 3.14;
double num4 = 1.23, num5 = 6.345

double num1, num2;

num1 = 1.32, num2 = 4.4231;

int age;
age = 22;
age = "Hi" // 오류발생
* */

// 변수의 사용
public class Main {
    public static void main(String[] args) {
        int age = 33;
        int num = 21;

        System.out.println(age + num);

        age = num;

        System.out.println(num + age);

        age = age + 1;
        System.out.println(num + age);

        System.out.println("Hello, I'm");
        System.out.println(age);
        System.out.print(age); // 줄붙이기

    }
}

