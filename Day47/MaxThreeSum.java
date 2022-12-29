import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Scanner;

/*
Scanner 사용
여러 숫자가 입력되면 가장큰 수 3개를 합해서 출력한다
*/
public class MaxThreeSum {

    public static void main(String[] args) {


        MaxThreeSum maxThreeSum = new MaxThreeSum();
        Scanner scan = new Scanner(System.in);
        int[] ary;
        int num = scan.nextInt();
        for (int i = 0; i < num; i++){
            ary[i] = scan.nextInt();
        }
        scan.close();
        System.out.println(maxThreeSum.ThreeSum(ary));
    }

    int ThreeSum(int[] ary){



        int sum = 0;
        for (int i = ary.length - 3; i < ary.length; i++){
            Arrays.sort(ary);
            sum += ary[i];
        }
        return sum;
    }
}
