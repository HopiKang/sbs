//생성자
// 인스턴스를 만든다, 인스턴스의 속성을 초기화시킨다
// 1 반환값이 없다, void로 선언하지않는다
// 2 초기화를 위한 데이터를 인수로 전달받을 수 있다
// 3 객체를 초기화하는 방법이 여러가지 존재할 경우 하나의 클래스가 여러개의 생성자를 가질수있다
// (메서드 오버로딩처럼 생성자 오버로딩도 가능하다)
// 4 선언하지않아도 기본생성자를 만들어준다 public 변수(){}
public class Main {
    public static void main(String[] args) {
        User user1 = new User("아이유", 27);
        /*
        위처럼 쓸수있다
        user1.setName("아이유");
        user1.setAge("27");
        */
        User user2 = new User("제니");

        System.out.println(user1.name);
        System.out.println(user1.age);
        System.out.println(user2.name);
        System.out.println(user2.age);
    }
}
