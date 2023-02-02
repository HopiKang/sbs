public class MyMaxNumberTest {
    /*
     람다식
     java 에서 함수형 프로그래밍을 구현하는 방식이다
     java 8 부터 지원시작했다
     클래스를 생성하지 않고 함수프로그래밍만으로 실행하게 해준다


     문법
     1 익명 함수를 만들어야한다
     2 매개 변수와 매개 변수를 활용한 실행문구현 (매개변수) >> (실행문)
     3 ex) add함수를 만든다
     int add(int x, int y) {return x + y; } >> (int x, int y)
     str >> {System.Out.Println(str);} // 매개변수(하나)인 경우 자료형과 괄호를 생략할 수 있다

     x, y >> {System.Out.Println(x + y);} // () 생략시 오류 발생
     str >> System.Out.Println(str); // {} 생략가능, 구현부가 한문장인 경우 중괄호 생략가능
     str >> return str.length(); // 중괄호 안에 구현부(return)가 있는경우 중괄호 생량할수 없다
     (x, y) >> x + y    // 중괄호 안에 구현부가 반환문이 하나라면 return과 중괄호를 모두 생략가능
     str >> str.length  // 중괄호 안에 구현부가 반환문이 하나라면 return과 중괄호를 모두 생략가능

    중요 : 단 하나의 메서드만 가져야 한다

    생성방법
    @FunctionalInterface 함수형 인터페이스라는 의미
     */

    public static void main(String[] args) {
        MyMaxNumber maxNum = (x, y) -> (x >= y) ? x : y;
        int max = maxNum.getMax(30, 50);
        System.out.println(max);
    }
}

@FunctionalInterface
interface MyMaxNumber{
    int getMax(int x, int y);

}