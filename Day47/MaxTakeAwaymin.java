
public class MaxTakeAwaymin {


    //배열안의 최댓값과 최소값의 차이를 구하여라
    int MaxMin(int[] intAry){
        int gap = 0;

        for (int i = 0; i < intAry.length; i++){
            int max = 0, min = 0;
            if(intAry[i] < max){
                max = intAry[i];
            }
            if (intAry[i] > min){
                min = intAry[i];
            }
            gap = max - min;
        }
        return gap;

    }
    public static void main(String[] args) {


        MaxTakeAwaymin maxTakeAwaymin = new MaxTakeAwaymin();
        int[] intAry = {1,2,3};
        System.out.println(maxTakeAwaymin.MaxMin(intAry));
    }


}
