import java.net.SocketOption;
import java.util.Scanner;

public class scanner {

    /*
    스캐너사용방법
    Scanner scanner = new Scanner(System.in); // 입력
    int age = scanner.nextInt();
    System.out.println("나이는 :" + age);
    */
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        boolean TopMenu = true;
        System.out.println("(I)ntro (C)ourses (E)xit");
        while (TopMenu){
            switch (scanner.next()){
                case "I":
                case "i":
                    System.out.println("안녕하세요 WEB 개발자 과정에 오신것을 환영합니다 \n" +
                            "함께 공부합시다!");
                    break;
                case "C":
                case "c":
                    boolean MiddleMenu = true;
                    while (MiddleMenu){
                        System.out.println("개발자 수업을 소개합니다 \n" +
                                "(D)ataBase (J)ava (S)pring (B)ack");
                        switch (scanner.next()){
                            case "D":
                            case "d":
                                System.out.println("DataBase 언어를 통해 데이터 관리에 대한 기초를 학습합니다. \n" +
                                        "강사 : 아이유\n" +
                                        "추천 선수과목 : 없음");
                                break;
                            case "J":
                            case "j":
                                System.out.println("Java의 기본 문법과 객체지향적 프로그래밍을 학습합니다. \n" +
                                        "강사 : 제니 \n" +
                                        "추천 선수과목 : DataBase");
                                break;
                            case "B":
                            case "b":
                                MiddleMenu = false;
                                break;
                        }
                    }
                    break;
                case "E":
                case "e":
                    System.out.println("안녕히 가세요");
                    TopMenu = false;
                    break;
                default:
                    System.out.println("다시 입력해 주세요");
                    break;
            }
        }
    }
}
