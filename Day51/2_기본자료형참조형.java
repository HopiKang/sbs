public class User {
    private int age;

    public static void main(String[] args) {
        int[] a = new int[2];
        System.out.println(a[0]);

        User[] people = new User[2];
        System.out.println(people[0]);

        User user = new User();
        people[0] = user;
        user.age = a[0]; // 기본 자료형 int
        a[0] = 26;
        System.out.println(user.age);

        a[0]++; // 27
        people[1] = people[0];
        people[1].age = a[0]; // 27
        a[0] = 28;
        System.out.println(people[0].age);

        String s = "null";
        if (s != null || !s.isEmpty()){
            System.out.println("정답 1");
        } else {
            System.out.println("정답 2");
        }

        String[] strings = new String[5];
        strings[0] = "안녕하세요";
        strings[2] = "";
        strings[4] = "java";

        int countA = 0, countB = 0;
        for (String str : strings){
            if (str != null && !str.isEmpty()){
                countA++;
            } else {
                countB++;
            }
        }
        System.out.println(countB); // 3

    }
}
