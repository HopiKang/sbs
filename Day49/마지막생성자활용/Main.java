/*
User, AccountNumber 생성자를 만든다

User 2개를 만든다
public User(String pName, int pAge)
인스턴스 변수 cashAmount 0 으로 시작, 단 pAge 가 음수면 인스턴스 변수 age는 15로 설정

public User(String pName, int pAge, int pCashAmount)
pAge 가 음수면 인스턴스 변수 age 는 15로 설정
pCashAmount 가 음수면 인스턴스 변수 cashAmount 를 0으로 설정한다

AccountNumber 3개의 생성자를 만든다

public AccountNumber(int pBalance)
- 잔액은 음수가 될 수 없습니다. 만약 음수가 입력되면 0으로 설정

public Account Number(User pOwner)
- pOwner 를 인스턴스 변수 owner 에 지정해 주고 잔액은 0으로 시작한다

public AccountNumber(int pBalance, User pOwner)
- balance 와 owner 를 설정해 주세요 그리고 잔액이 음수인 경우에는 balance 를 0으로 설정

WordBank

1. 1번 생성자를 이용해서 인스턴스 user1 을 만들어 주세요 생성 후 보유 현금은 30000 재설정
2. 2번 생성자를 이용해서 인스턴스 user2 을 만들어 주세요 보유 현금 초기값을 100000 으로 설정
3. AccountNumber 의 2번 생성자를 사용해서 인스턴스 accountNumber1 을 만들어주세요
    파라미터로 user1을 넘겨주고 user1 과 accountNumber1 을 연결해 준다
    생성한 다음 잔액을 100000 으로 설정
4. AccountNumber 의 3번 생성자를 사용해서 인스턴스 a2를 만든다
    파라미터로 user2 를 넘겨주고 user2 와 a2 를 연결해준다
    그리고 잔액 초기값은 500000 을 준다

accountNumber2.transfer(accountNumber1, 200000)
accountNumber2.transfer(user2, 150000)
user2.transfer(accountNumer1, 270000)
user2.transfer(user2, 130000)
로 넘겨줘서 결과가 같게 나오는지 확인하기

결과값
true - from : 제니, to : 아이유, amount : 200000, balance : 300000
true - from : 아이유, to : 제니, amount : 150000, balance : 150000
true - from : 제니, to : 아이유, amount : 270000, balance : 180000
true - from : 아이유, to : 제니, amount : 130000, balance : 290000
*/

public class Main {
}
