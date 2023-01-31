public class Main {
    public static void main(String[] args) {
        Person person = new Person("이유", "아");
//        person.
        Object object = new Object();
        // object 클래스는 최상위 클래스이다
        // 즉 모든 클래스의 부모클래스가 object 클래스
//        object.
        // person 은 object 에게 상속받고있다
        System.out.println(person.toString());
        System.out.println(person);
//        System.out.
    }
}
