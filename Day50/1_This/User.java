public class User {

    //현재의 인스턴스를 아리키는 역할
    //생성자 현재 클래스의 생성자로 사용할 수 있다

    private String name;

    public User(String pName){
        name = pName;
    }

    public void sayHello(){
        System.out.println("안녕하세요" + this.name);
        // this를 이용해서 바로받아올수있다
    }

    /*
    private int age;

    public User(String name){
        this(name, 12);
    }

    public User(String name, int age){
        this(name, age, 12);
    }
    */

}
