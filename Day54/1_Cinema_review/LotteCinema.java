import java.util.EnumSet;

public class LotteCinema {
    private Seat[][] seats; // LotteCinema 클래스안에서 쓰일 2차배열 생성

    private int rowCount, colCount; // 좌석위치를 찾을 rowCount, colCount 생성

    public LotteCinema(int rowCount, int colCount){
        // 좌석생성 LotteCinema 클래스가 불려지는순간 실행?

        if (rowCount > 26){ // Main클래스에서 받아온 rowCount를 세로열로 지정할경우 최대 알파벳 26개까지 지정
            rowCount = 26; // 26번째 알파벳을 넘어갈경우 26으로 지정
        }

        seats = new Seat[rowCount][colCount]; // 좌석에 쓰일 2차배열에 rowCount 세로열 colCount 가로열 크기지정

        for (int i = 0; i < rowCount; i++){
            for (int j = 0; j < colCount; j++){
                seats[i][j] = new Seat(); // seats좌석위치마다 새로운 인스턴스 생성
            }
        }
        this.rowCount = rowCount; // Main클래스에서 받아온 값을 위 LotteCinema rowCount 변수에 들어갈 값이 자동으로 대입
        this.colCount = colCount; // Main클래스에서 받아온 값을 위 LotteCinema colCount 변수에 들어갈 값이 자동으로 대입
    }

    private int getRowIndex(char uppercaseChar){return uppercaseChar - 'A';}
    // 'A'는 유니코드로 65
    // 반환값을 char알파벳에서 int형으로 바꿔줌


    public boolean reservation(String name, char rowChar, int col, int numSeat){
        // 리턴값은 Main클래스에서 만약 실패할경우 true는 에약성공, false는 예약실패로 반환할거기때문에 boolean으로 반환
        // Main에서 String, char(알파벳), int(가로좌석위치), int(가로좌석개수) 의 값을 받아옴

        int row = getRowIndex(rowChar) + 1;
        // 값을 받아온 알파벳값이 A라면 위 getRowIndex에서 A값(유니코드)로 뺀 세로좌석위치를 row값에 저장

        if (row > rowCount || col > colCount || col + numSeat - 1 > colCount){
            // row가 LotteCinema메서드에서 새로 this로 지정한 26(알파벳최대개수)를 넘지않거나
            // col(가로좌석위치)가 Main에서 받아온 colCount(가로최대길이)보다 크지않거나,
            // col(가로좌석위치) + numSeat(가로좌석길이)가 colCount(가로최대길이) 보다 크지않을경우
            return false; // false(예약실패) 리턴
        }

        for (int i = 0; i < numSeat; i++){
            Seat current = seats[row - 1][col - 1 + i];
            // Seat 클래스에 인스턴스변수 current를 생성
            // current는 seats(LotteCinema클래스안에 변수사용) row(세로좌석위치 인덱스라 - 1)
            // col(가로좌석위치 i를 계속더해서 가로좌석 하나하나확인) 위치값

            if (current.limited()){ // 좌석에 저장된 이름이 null값이 아닌경우 true 밑실행
                for (int j = 0; j < i; j++){
                    seats[row - 1][col - 1 + j].cancel();
                }
                return false;
            }
            //
            current.reservation(name);
            // current가 Seat클래스와 연결되있음 고로 Seat.reservation으로 봐도됨
            // 예약자이름을 this.name으로 고정? reservation안의 name으로 자동 대입
        }
        return true;

    }

    public int cancel(String name){
        // String형 name을 받아서 결정

        int canceledCount = 0;
        // 취소된 좌석수를 담을 변수

        for (int i = 0; i < rowCount; i++){
            for (int j = 0; j < colCount; j++){
                Seat seat = seats[i][j]; // Seat클래스에서 인스턴스생성 seat위치값 생성
                if (seat.limited() && seat.match(name)){
                    // 좌석에 이름이 null이 아닌경우 true and 좌석의 이름이 Seat클래스의 name과 일치하는경우 true
                    seat.cancel();
                    //좌석에 지정된 이름 삭제(null로 지정)
                    colCount++;
                    // 취소도니 좌석수 축적
                }
            }
        }
        return canceledCount;
        // 취소된 좌석수 리턴
    }

    public int cancel(char rowChar, int col, int numSeat){
        int row = getRowIndex(rowChar) + 1;
        // 값을 받아온 알파벳값이 A라면 위 getRowIndex에서 A값(유니코드)로 뺀 세로좌석위치를 row값에 저장

        if (row > rowCount || col > colCount){
            // row(세로좌석위치)가 rowCount(최대세로길이)보다 크거나 col(가로좌석위치)이 colCount(세로좌석위치)보다 클경우
            return 0;
        }

        if (col + numSeat - 1 > colCount){
            numSeat = colCount - col + 1;
        }

        int canceledCount = 0;
        // 취소된 좌석개수를 담을 변수생성

        for (int i = 0; i < numSeat; i++){
            // numSeat(취소좌석개수)크기만큼 반복
            if (seats[row - 1][col - 1 + i].limited()){
                // 좌석에 저장된 이름이 null값이 아닌경우 true 밑실행
                seats[row - 1][col - 1 + i].cancel();
                // 좌석에 저장된 이름을 null로 변경
                canceledCount++;
                // 취소좌석 축적
            }
        }
        return canceledCount;
        // 취소된 좌석개수 리턴
    }

    public void seatStructure(){
        //좌석출력 바로 반환하기위해서 void로 작성
        System.out.print("  ");
        // 맨처음 알파벳 앞에 자리 띄우기
        for (int i = 1; i <= 9; i++){
            // i가 9까지라 적혀있지만 colCount값이라 할수있다
            System.out.print("  " + i);
            // 가로좌석 숫자사이 띄우기
        }
        System.out.println();
        //한줄 띄우고 시작

        for (int i = 0; i < rowCount; i++){
            System.out.print((char) ('A' + i) + ": ");
            // rowCount(세로좌석길이)만큼 알파벳생성, char(유니코드)로 i값을 더해가며 알파벳을 바꿔서 출력
            for (int j = 0; j < colCount; j++){
                Seat s = seats[i][j];
                if (s.limited()){
                    // 좌석에 저장된 이름이 null값이 아닌경우 true 밑실행
                    System.out.print("[0]");
                } else {
                    // 좌석에 저장된 이름이 null값이 맞는경우 true 밑실행
                    System.out.print("[ ]");
                }
            }
            System.out.println();
        }
    }

    // 총 에약좌석
    public int getNumberOfReservedSeat(){
        //void를 사용하지 않은이유는 문자열 리턴이 아니기때문
        int reservedCount = 0;
        //총에약좌석을 담을 변수생성
        for (int i = 0; i < rowCount; i++){
            for (int j = 0; j < colCount; j++){
                Seat seat = seats[i][j];
                // 좌석하나하나마다 인스턴스생성
                if (seat.limited()){
                    // 좌석에 저장된 이름이 null값이 아닌경우 true
                    reservedCount++;
                }
            }
        }
        return reservedCount;
        // 총예약좌석 리턴
    }


}
