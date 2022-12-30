/*
만약 3을 파라미터로 받는다면
1
2 3
4 5 6
이라는 삼각형을 만들어라
*/
public class DrawFloydsTriangle {
    public void drawFloydsTrianglePrint(int height){
        int length = String.valueOf(height * (1 + height) / 2).length();
        int number = 1;

        for (int row = 1; row <= height; row++){
            String line = "";
            for (int col = 1; col < row; col++) {
                for (int i = String.valueOf(number).length(); i < length; i++){
                    line += "";
                }
                line += (number + "");

                number++;
            }
            System.out.println(line);
        }

    }
}
