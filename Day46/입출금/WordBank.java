/*
        객체에 속성변수와 동작 메소드(함수)가있다면
        속성변수에는 예를들어 User에 이름,나이,보유현금,소유계좌가 있고
        동작 메소드는 AccountNumber에 잔액,소유자,입금,출금,이체가 있다

        객체단위로 묶어서 만들수있다

        */
public class WordBank {
    public static void main(String[] args) {
        // main메소드는 객체가 돌아가면 무조건 한번은 사용된다
        // 무조건 객체안에는 하나 존재해야한다

        //user1에 User라는 인스턴스 변수가 생성됨
        User user1 = new User();
        //user1의 인스턴스변수안에 name을
        user1.name = "아이유";
        user1.age = 28;
        user1.cashAmount = 10000;

        System.out.println(user1.name);
        System.out.println(user1.age);
        System.out.println(user1.cashAmount);

        //인스턴스변수 생성
        AccountNumber accountNumber1 = new AccountNumber();
        accountNumber1.balance = 10000;

        //user1의 account과 accountNumber1의 관계를 맺어준다
        user1.account = accountNumber1;
        //accountNumber1의 owner는 user1의 인스턴스이다
        accountNumber1.owner = user1;

        System.out.println(user1.name + "의 계좌 잔액은 :" + user1.account.balance);


    }
}
