import java.util.HashMap;
import java.util.Scanner;

public class WinningElection {
    public static void main(String[] args) {
        WinningElection winningElection = new WinningElection();
        Scanner keyBoardInput = new Scanner(System.in);
        int num = keyBoardInput.nextInt();
        String str = keyBoardInput.next();
        System.out.println(winningElection.resolve(num, str));
    }

    public char resolve(int num, String str){
        char answer = ' ';
        HashMap<Character, Integer> map = new HashMap<>();
        for (char x : str.toCharArray()){
            map.put(x, map.getOrDefault(x, 0) + 1);
        }
//        System.out.println(map.containsKey('A')); 확인

        int max = Integer.MIN_VALUE;
        for (char key : map.keySet()){
//            System.out.println(key + " " + map.get(key)); 확인
            if (map.get(key) > max){
                max = map.get(key);
                answer = key;
            }
        }

        return answer;
    }
}
