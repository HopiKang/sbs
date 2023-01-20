import java.util.ArrayList;
import java.util.Scanner;

public class Comparison {
/*
4. 선생님 N명의 학생을 일렬로 줄세우고, 일렬로 서 있는 학생의 키가 앞에서부터 순서대로
주어질때, 맨 앞에서 선생님이 볼 수 있는 학생의 수를 구하는 프로그램을 작성하세요
ex) 어떤 학생이 자기 앞에 서있는 학생들보다 크면 그 학생은 보이고, 작으면 안보임
입력 : 7
입력 : 145 160 153 161 158 170 180
출력결과 : 5
*/
    private ArrayList<Integer> numlist = new ArrayList<>();
    public static void main(String[] args) {

        Comparison comparison = new Comparison();
        Scanner keyBoardInput = new Scanner(System.in);
        int n = keyBoardInput.nextInt();
        int arr[] = new int[n];
        for (int i = 0; i < n; i++){
            arr[i] = keyBoardInput.nextInt();
        }

        System.out.println(comparison.resolve(n, arr));
    }

    public int resolve(int n, int[] arr){
        int answer = 1, max = arr[0];
        for (int i = 1; i < n; i++){
            if(arr[i] > max){
                max = arr[i];
                answer++;
            }
        }
        return answer;

    }
}
