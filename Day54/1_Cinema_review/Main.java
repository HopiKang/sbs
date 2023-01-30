public class Main {
    /*
    1. 상영관 좌석 만들기
    2. 예약 아이유 A 행 5 부터 2개 성공 또는 실패
       예약 제니 C 행 1 부터 3개 성공 또는 실패
       예약 수지 D 행 4 부터 7개 성공 또는 실패
       예약 문채원 C 행 7 부터 3개 성공 또는 실패
       예약 지수 F 행 5 부터 3개 성공 또는 실패

       취소 A 행 4 부터 3개 몇개의 좌석이 취소되었습니다
       제니님의 좌석 취소 : 총 ? 개의 좌석이 취소되었습니다
*/
    public static void main(String[] args) {
        LotteCinema lotteCinema = new LotteCinema(8,9);

        // 영화예약
        System.out.println("아이유님 이름으로 A5로부터 2개의 좌석예약 : " +
                (lotteCinema.reservation("아이유", 'A', 5 , 4) ? "예약성공" : "예약실패"));

        // 취소
        System.out.println("A6부터 좌석 3개 취소 : 총" +
                lotteCinema.cancel('A', 6, 3) + "개의 좌석이 취소 되었습니다");
        // 여기서의 cancel은 Seat의 cancel과 상관없는것인가?

        // 좌석출력
        lotteCinema.seatStructure();

        // 총예약좌석출력
        System.out.println(lotteCinema.getNumberOfReservedSeat());
    }

}

// Seat클래스에  reservation안에 name을 왜 this로 고정해놓은건지
// Seat클래스에 따로 빼놓은이유가 뭔지 모르겠습니다
// 혹시 Seat클래스에서 this.name으로 고정하면 LotteCinema메서드에서도 영향을 주기때문인가요?

// Seat클래스의 getName메서드를 어디에 활용하는지 모르겠습니다
// 밑에 match에 name.equals에 사용하는건가요?

// Seat클래스와 LotteCinema클래스의 연결성? 관계를 잘모르겠습니다

// Seat클래스의 cancel메서드안에 name = null 과 limited메서드안에 name != null은
// 좌석에 저장된 이름을 null로 변경되는건가요 받아온 값의 이름을 null로 지정되는건가요
