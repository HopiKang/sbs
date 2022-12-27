import java.util.Scanner;

public class CaseConversion{
    public static void main(String[] args){
        CaseConversion caseConversion = new CaseConversion();
        Scanner keyBoardInput = new Scanner(System.in);
        String str = keyBoardInput.next();
        System.out.println(caseConversion.resolve(str));
    }
    public String resolve(String str){
        String answer = "";

        for(char x : str.toCharArray()){
            if(Character.isLowerCase(x))
                answer += Character.toUpperCase(x);
            else
                answer += Character.toLowerCase(x);
        }
        return answer;
    }
}

