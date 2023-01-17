public class User {
    // 클래스 메서드
    // 인스턴스 생성없이 메서드만 모아서 사용하고 싶을때 사용한다

    static int count;

    public static void increment(){
        count++;
    }

    public static void main(String[] args) {
        System.out.println(Math.abs(-10)); // Math 클래스 절대값
        System.out.println(Math.max(5, 10)); // 최대값
        System.out.println(Math.random()); // 랜덤한수를 생성

        System.out.println(User.count);
        User.increment(); // count++
        System.out.println(User.count);
        User.increment();
        System.out.println(User.count);
        User.increment();
        System.out.println(User.count);
    }
}
