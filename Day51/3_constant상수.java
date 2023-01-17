public class User {
    // 상수
    // 한번 정의되면 바꿀수없다

    //final double pi = 3.14; // 상수생성
    // pi = 31; 오류발생

/*    // private final String name; u1의 name을 setter로 바꿀수없기때문에 오류가 뜬다
    private String name;

    private String getName(){
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User(String name){
        this.name = name;
    }

 */
    public static void main(String[] args) {
        /*
        final User u1 = new User("아이유");
        u1.setName("제니");
        System.out.println(u1.getName());
         */
        int[] numberList = new int[7];
        System.out.println(numberList.length);
        // numberList.length = 10; length는 상수변수이기때문에 바꿀수없다
    }
}
