import java.lang.reflect.Array;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
//        ArrayList<String> namelist = new ArrayList<>();
//        namelist.add("추가1");
//        namelist.add("추가2");
//        namelist.add("추가3");
//        namelist.add("추가4");
//        namelist.add("추가5");
//        namelist.add("추가6");
//        namelist.add("추가7");
//        namelist.add("추가8");
//        System.out.println(namelist.size());
//        // 크기확인
//        System.out.println(namelist.get(0));
//        // 0 index 의 값을 출력
//        System.out.println(namelist);
//        // 전체출력
//        namelist.remove(6);
//        // index 6의 값이 지워진다
//        System.out.println(namelist);

        // 정수 ArrayList
        ArrayList<Integer> nameList = new ArrayList<>();
        nameList.add(1);
        nameList.add(2);
        nameList.add(3);
        nameList.add(4);
        nameList.add(5);
        nameList.add(6);
        for (int nums: nameList){
            System.out.println(nums * nums);
        }

        // Integer란
        // 웨퍼클래스라 부르고 객체형식으로 감싸주는것을 말한다
        // int - integer, double - Double, byte - Byte, char - Character
        // float - Float, boolean - Boolean, long - Long, short - Short
        // 웨퍼클래스로 바꾸는걸 박싱, 웨퍼클래스를 기본타입으로 바꾸는걸 언박싱이라 부른다
        // 기본형을 참조형으로 바꿀때 사용한다(ArrayList 는 참조형으로만 사용가능하다)
        // Integer 1 = new Integer(355); 박싱
        // Integer inums = i.intValue(); 언박싱
        // Integer intNum = 28; 자동박싱
        // int n = intNum; 자동언박싱

        String str1 = "30";
        String str2 = "30.4";
        String str3 = "true";

        byte b = Byte.parseByte(str1);
        // 기본형으로 변환
        System.out.println(123 == 123);
        System.out.println(new Integer(456) == new Integer(456));
        // 밑 결과가 false 가 나오는 이유는 참조형이기 때문이다
        System.out.println(new Integer(789).equals(new Integer(789)));

        // java에는 기본형, 참조형(객체, String, int[])
        // 기본형은 값 자체를 보관하는것이다
        int a = 3;
        int b = a;

        System.out.println(a);
        System.out.println(b);
        // 둘다 같은값이 나온다

        a = 4;
        System.out.println(a);
        System.out.println(b);
        // a만 바뀌고 b는 그대로

        b = 7;
        System.out.println(a);
        System.out.println(b);
        // b만 바뀌고 a는 그대로이다

        // 참조형
        // 변수가 값자체를 보관하는게 아니라 변수가 값을 가르킨다
        //
        User u1, u2;
        u1 = new User("아이유", 28);

        u2 = u1;
        // u2와 u1이 같은 영역을 가르킨다
        u2.setName("제니");
        // u2의 setName을 바꿔서 u2만 바뀐다

        System.out.println(u1.getName());
        System.out.println(u2.getName());

        int[] c = new int[3];
        int[] d = c;

        c[0] = 1;
        d[0] = 2;

        System.out.println(c[0]);
        System.out.println(d[0]);


        String s1 = "안녕";
        String s2 = "안녕";

        String s11 = new String("안녕");
        String s22 = new String("안녕");

        System.out.println(s1 == s2);
        System.out.println(s1.equals(s2));
        System.out.println(s11 == s22);
        System.out.println(s11.equals(s22));
        //객체로 만들었을때는 equals을 썼을때만 true가 나온다
        //java 의 springfull 을 검색해보기

    }
}
