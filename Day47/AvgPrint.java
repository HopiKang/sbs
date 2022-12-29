/*
intAry로 배열 만들기
printAverage 메서드
int형 배열을 받는다 {3,7,5}{1,3,5,7}{3}{5,6,7,8,9} 순서대로 파라미터로 받는것
//결과는 평균값 소숫점 한자리까지 받기 (자료형 double)
*/
public class AvgPrint {
    /*
    for each
    int sum = 0;
    for (int i : intAry){
        sum += i;
    }
    */

    double printAverage(int[] intAry){
        if(intAry.length < 2){
            return 0;
        }

        int sum = 0;

        for(int i = 0; i < intAry.length; i++){
            sum += intAry[i];
        }

        return (double) sum / intAry.length;
    }

    public static void main(String[] args) {

        AvgPrint avgPrint = new AvgPrint();
        int[] printAry1 = {3,7,5};
        System.out.println(avgPrint.printAverage(printAry1));
    }


}
