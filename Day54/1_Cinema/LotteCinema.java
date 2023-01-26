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

    public boolean reservation(String name, char rowChar, int col, int numSeat){
        // System.out.println(getRowIndex(rowChar));
        int row = getRowIndex(rowChar) + 1;

        if (row > rowCount || col > colCount || col + numSeat - 1 > colCount){
            return false;
        }

        for (int i = 0; i < numSeat; i++){
            Seat current = seats[row - 1][col - 1 + i];

            if (current.limited()){
                for (int j = 0; j < i; j++){
                    seats[row - 1][col - 1 + j].cancel();
                }
                return false;
            }

            //에약이 안된 빈자리인 경우 예약
            current.reservation(name);
        }

        return true;
    }

    //취소
    public int cancel(String name){
        int canceledCount = 0;
        for (int i = 0; i < rowCount; i++){
            for (int j = 0; j < colCount; j++){
                Seat seat = seats[i][j];
                if (seat.limited() && seat.match(name)){
                    seat.cancel();
                    canceledCount++;
                }
            }
        }
        return canceledCount;
    }

    //취소
    public int cancel(char rowChar, int col, int numSeat){
        int row = getRowIndex(rowChar) + 1;

        if (row > rowCount || col > colCount){
            return 0;
        }

        if (col + numSeat - 1 > colCount){
            numSeat = colCount - col + 1;
        }

        int canceledCount = 0;

        for (int i = 0; i < numSeat; i++){
            if (seats[row - 1][col - 1 + i].limited()){
                seats[row - 1][col - 1 + i].cancel();
                canceledCount++;
            }
        }
        return canceledCount;
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

    private int getRowIndex(char uppercaseChar){
        return uppercaseChar - 'A';
    }

    //총 예약좌석
    public int getNumberOfReservedSeat(){
        int reservedCount = 0;

        for (int i = 0; i < rowCount; i++){
            for (int j = 0; j < colCount; j++){
                Seat seat = seats[i][j];
                if (seat.limited()){
                    reservedCount++;
                }
            }
        }
        return reservedCount;
    }

}
