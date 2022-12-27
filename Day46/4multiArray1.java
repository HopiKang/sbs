public class Main{
    public static void main(String[] args){
        int[][] multiArray = {
                {1,2,3,4},
                {5,6,7,8},
                {9,10,11,12}
        };

        int[][] multiArray1 = new int[3][4]; // 열 행 순서로 넣을수있다

        for (int i = 0; i < multiArray1[0].length; i++){
            for (int j = 0; j < multiArray1[i].length; j++){
                multiArray1[i][j] = (i * 4 + 1) + j;
            }
        }

    }
}