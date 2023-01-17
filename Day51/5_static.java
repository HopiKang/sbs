public class User {
    static int count; // static 은 인스턴스가 공통, 공유 목적으로 사용하는 것입니다
    // 모든 인스턴스가 동일한값을 참조할수있게 만들어준다 (글로벌변수)
    // 객체를 생성하지않고도 사용가능하다
    // 최초의 생성된다

    public static void main(String[] args) {
        User u1 = new User();
        // u1.count++;
        User.count++;

        User u2 = new User();
        // u1.count++;
        // u2.count = u1.count;
        User.count++;

        User u3 = new User();
        // u1.count++;
        // u2.count++;
        // u3.count = u2.count;
        User.count++;

        User u4 = new User();
        // u1.count++;
        // u2.count++;
        // u3.count++;
        // u4.count = u3.count;
        User.count++;

        // System.out.println(u1.count);
        // System.out.println(u2.count);
        // System.out.println(u3.count);
        // System.out.println(u4.count);
        System.out.println(User.count);
    }

    /*
    public User(){
        count++;
    }

    public static void main(String[] args) {
        User u1 = new User();
        User u2 = new User();
        User u3 = new User();
        User u4 = new User();

        System.out.println(User.count);
    }
    // 로 줄일수도있다
    */

    public static final double PI = 3.14;
    public static final double FORML_USE = 2.876;
    // 상수 변수명은 언더바와 대문자로 만든다
}
/*
변수의 생명주기와 범위

           생성시간과 메모리                생존주기                     범위
멤버변수    new 할때 heap에 생성            new 할때 heap에 생성          class내에서 사용
static     프로그램이 메모리에 load될때      프로그램이 unload될때까지      모든 인스턴스가 공유
지역변수    변수가 선언된 함수가 수행될때      함수의 수행이 끝날때까지        함수 내에서만 사용 가능
*/

