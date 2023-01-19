public class Member {
    // toString 객체를 문자열로 리턴해주는 메소드
    // overriding(재정의)

    private String name;
    private int age;

    public Member(String name, int age){
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString(){
        return "이름 : " + name + "나이 : " + age;
    }
}
