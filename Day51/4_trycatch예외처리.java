import java.util.Scanner;

public class trycatch {
    // 예외처리
    public static void main(String[] args) {
        /*
        System.out.println("숫자를 입력하세요");
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt(); // 만약 문자를 입력한다면 오류발생
         */

        /*
        int[] smallArray = new int[3];
        for (int i = 0; i < 10; i++){
            smallArray[i] = i;
        } // index가 범위를 벗어나서 오류발생
        */

        /*
        String[] strings = new String[2];
        strings[0] = "DEV";

        for (int i = 0; i < strings.length; i++){
            System.out.println("string[" + i + "[의 값은 DEV 입니다." + strings.equals("DEV"));
        }
        */

        /*
        try {
            // 오류를 발생시킬 수 있는 코드를 try로 감싼다
        } catch (ArrayIndexOutOfBoundsException e){ // e를 주로사용
            // 오류가 발생할 경우 catch 해서 처리한다
            // 파라미터로 Exception 이라는 class 인스턴스를 받을 수 있다
        }
        */

        int[] smallArray = new int[3];
        for (int i = 0; i < 10; i++){
            try {
                smallArray[i] = i;
            } catch (ArrayIndexOutOfBoundsException e){
                System.out.println(i + "번째 배열에서 예외가 발생 하였습니다");
            }
            for (int j : smallArray) {
                System.out.println(j);
            }
        }
    }
}
