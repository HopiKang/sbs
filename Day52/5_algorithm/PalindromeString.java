import java.util.Objects;
import java.util.Scanner;
/*
1. 드라마 이상한 변호사 우영우에서 주인공 우영우가 자기 소개를 할때 제 이름은 똑바로 읽어도
거꾸로 읽어도 우영우 입니다. 기러기 토마토 스위스 인도인 별동별 처럼 이를 회문 또는 팰린드롬
이라고 합니다 단어를 입력받고 회문이면 yes 아니면 no인 프로그램을 만드시오
 */
public class PalindromeString {
    public static void main(String[] args) {
        PalindromeString palindromeString = new PalindromeString();
        Scanner keyBoardInput = new Scanner(System.in);
        String str = keyBoardInput.next();
        System.out.println(PalindromeString.resolve(str));
    }

    public static String resolve(String str){
        String answer = "NO";
        String tmp = new StringBuilder(str).reverse().toString();
        if (str.equalsIgnoreCase(tmp)){
            answer = "YES";
        }
        return answer;
    }
}
