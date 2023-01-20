public class LotteCinema {
    private Seat[][] seats;

    private int rowCount, colCount;

    public LotteCinema(int rowCount, int colCount){
        // 알파벳이 총 26 개 존재
        if (rowCount > 26){
            rowCount = 26;
        }

        seats = new Seat[rowCount][colCount];
        for (int i = 0; i < rowCount; i++){
            for (int j = 0; j < colCount; j++){
                seats[i][j] = new Seat();
            }
        }
        this.rowCount = rowCount;
        this.colCount = colCount;

    }

    // 좌석출력
    public void seatStructure(){
        System.out.println("     ");
        for (int i = 1; i <= 9; i++){
            System.out.print("  " + i);
        }
        System.out.println();

        for (int i = 0; i < rowCount; i++){
            System.out.print((char) ('A' + i) + ": ");
            for (int j = 0; j < colCount; j++){
                Seat s = seats[i][j];
                if (s.limited()){
                    System.out.print("[0]");
                } else {
                    System.out.print("[ ]");
                }
            }
            System.out.println();
        }
    }



}
