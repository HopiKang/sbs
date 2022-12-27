import java.util.Scanner;

public class Findchar{
    public static void main(String[] args){
        Findchar 0 = new FindChar();
        Scanner keyBoardInput = new Scanner(System.in);
        Scanner fullStr = keyBoardInput.next();
        char findChar = keyBoardInput.next().charAt(0);
        System.out.println(0.resolve(fullStr, findChar));
    }

    public int resolve(String s, char t){
        int answer = 0;
        s = s.toUpperCase();
        t = t.Character.toUpperCase(t);

        for(char x : s.toCharArray()){
            if(x == t) answer++;
        }
        return answer
    }
 }
}