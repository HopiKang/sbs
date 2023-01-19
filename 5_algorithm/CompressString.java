import java.util.Scanner;

/*
2. 알파벳 대문자 또는 소문자로 이루어진 문자열을 입력받아 같은 문자가 연속적으로 면번 반복
되는지 오른쪽에 반복횟수를 표기하는 방법으로 문자열을 압축하는 프로그램을 작성하세요
입력문자 : innnnovaaattiioonnnnn
출력 : in4ova3ti2o2n5
*/
public class CompressString {
    public static void main(String[] args) {
        CompressString compressString = new CompressString();
        Scanner keyBoardInput = new Scanner(System.in);
        String str = keyBoardInput.next();
        System.out.println(compressString.resolve(str));
    }

    public String resolve(String s){
        String answer = "";
        s = s + " ";
        int cnt = 1;
        for (int i = 0; i < s.length() - 1; i++){
            if (s.charAt(i) == s.charAt(i + 1)){
                cnt++;
            } else {
                answer += s.charAt(i);
                if (cnt > 1){
                    answer += String.valueOf(cnt);
                    cnt = 1;
                }
            }
        }
        return answer;
    }
}
