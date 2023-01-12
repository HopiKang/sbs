import java.util.ArrayList;
import java.util.Scanner;

public class WordInversion {
    public static void main(String[] args) {
        // 만약 3개의 단어를 받는다면 알파벳을 거꾸로 반환해라

        WordInversion wordInversion = new WordInversion();
        Scanner keyBordInput = new Scanner(System.in);
        int n = keyBordInput.nextInt();
        String[] str = new String[n];

        for (int i = 0; i < n; i++){
            str[i] = keyBordInput.next();
        }
        for (String x : wordInversion.resolve(n, str)){
            System.out.println(x);
        }

    }

    public ArrayList<String> resolve(int n, String[] str){
        ArrayList<String> answer = new ArrayList<>();

        for (String x : str){
            String tmp = new StringBuilder(x).reverse().toString();
            answer.add(tmp);
        }

        return answer;

    }
}
