import java.util.Scanner;

// on a dark desert highway cool wind in my hair
// 단어 찾기
// 힌트 split() : 잘라내기, substring,

public class WordSearch {
    public static void main(String[] args) {
        WordSearch wordSearch = new WordSearch();
        Scanner keyBoardInput = new Scanner(System.in);
        String str = keyBoardInput.nextLine();
        System.out.println(wordSearch.resolve(str));
    }

    public String resolve(String str){
        String answer = "";
        int m = Integer.MIN_VALUE;
        //System.out.println(Arrays.toString(str.toString().split(" ")));
        String[] s = str.split(" ");
        for(String x : s){
            int len = x.length();
            if(len > m){
                m = len;
                answer = x;
            }
        }

        return answer;
    }
    /*
    public String resolve(String str){
        String answer = "";
        int m = Integer.MIN_VALUE, tem;

        while((tem = str,intdexOf(' ')) != -1){
            String tmp = str.substring(0, tem);
            int len = tem.length();
            if(len > m){
                m = len;
                answer = tmp;
            }
            str = str.substring(tem + 1);
        }
        if (str.length() > m) answer = str;
        return answer
    }
    */


}
