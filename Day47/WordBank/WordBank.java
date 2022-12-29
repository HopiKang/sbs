/*
입금과 출금 메소드 만들기
받은사람의 잔고에 파라미터로 받은 값을 더해준다
입금이 성공되면 계좌의 주인의 현금액이 줄어든다
입금할 금액이 잔액보다 작을경우 입금실패(0원입금하면 성공)
- 입금 실패 하였습니다 잔고 : 원, 현금 : 원
- 출금성공 하였습니다 잔고 : 원, 현금 : 원

5만원입금, 18만원출금, 73만원입금, 70만원 출금 순서대로하기

WordBand클래스의 User2라는 변수에 해당하는 AccountNumber2를 만들고 두인스턴스를 연결
현금 보유를 10만원에서 시작하고 AccountNumber2는 5만원에서 시작한다
*/
public class WordBank {
    public static void main(String[] args) {
        User user1 = new User();
        user1.name = "아이유";
        user1.age = 28;
        user1.cashAmount = 100000;

        AcountNumber accountNumber1 = new AccountNumber;
        accountNumber1.balance = 100000;

        user1.account = accountNumber1;
        accountNumber1.owner = user1;

        // 인스턴스 생성 "제니" "25살" "현금보유 100000"

        User user2 = new User();
        user2.name = "제니";
        user2.age = 25;
        user2.cashAmount = 100000;

        AccountNumber accountNumber2 = new AccountNumber();
        accountNumber2.balance = 500000;

        user2.account = accountNumber2;
        accountNumber2.owner = user2;

        accountNumber2.deposit(50000);
        accountNumber2.withdraw(180000);
        accountNumber2.deposit(730000);
        accountNumber2.withdraw(700000);

    }
}

