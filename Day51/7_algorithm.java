import java.util.Scanner;
// P@ssWord >> d@roWssP
// 틀수문자 위치는 그대로 알파벳은 거꾸로
public class Wordinversion {
    public static void main(String[] args) {
        Wordinversion wordinversion = new Wordinversion();
        Scanner keyBoardInput = new Scanner(System.in);
        String str = keyBoardInput.next();
        System.out.println(wordinversion.resolve(str));
    }

    public String resolve(String str){
        String answer;
        char[] s = str.toCharArray();
        int lt = 0, rt = str.length() -1;
        while (lt < rt) {
            if (!Character.isAlphabetic(s[lt])) { // Character.isAlphabetic 알파벳인지 확인
                lt++;
            }else if (!Character.isAlphabetic(s[rt])) {
                rt--;
            }else {
                char tmp = s[lt];
                s[lt] = s[rt];
                s[rt] = tmp;
                lt++;
                rt++;
            }
        }
        answer = String.valueOf(s);
        return answer;
    }
}

/*
1. 드라마 이상한 변호사 우영우에서 주인공 우영우가 자기 소개를 할때 제 이름은 똑바로 읽어도
거꾸로 읽어도 우영우 입니다. 기러기 토마토 스위스 인도인 별동별 처럼 이를 회문 또는 팰린드롬
이라고 합니다 단어를 입력받고 회문이면 yes 아니면 no인 프로그램을 만드시오

2. 알파벳 대문자 또는 소문자로 이루어진 문자열을 입력받아 같은 문자가 연속적으로 면번 반복
되는지 오른쪽에 반복횟수를 표기하는 방법으로 문자열을 압축하는 프로그램을 작성하세요
입력문자 : innnnovaaattiioonnnnn
출력 : in4ova3ti2o2n5
*/
