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
        LotteCinema lotteCinema = new LotteCinema(8, 9);

        //영화예약
        System.out.println("아이유님 이름으로 A5로부터 2개의 좌석예약 :" +
                (lotteCinema.reserve("아이유", 'A', 5, 2) ? "예약성공", "예약실패"));

        //취소
        System.out.println("A부터 좌석 3개 취소 : 총" +
                lotteCinema.cancel('A', 6, 3) + "개의 좌석이 취소 되었습니다"));

        //좌석출력
        lotteCinema.seatStructure();

    }
}
