// this, super
// super 가 사용되는 경우
// 1. 자식 클래스가 부모 클래스의 변수, 메소드를 사용할때
// 2. 자식 클래스가 부모 클래스의 생성자를 사용할때
public class AccountNumber {
    private int balance;

    public int getBalance(){
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public  boolean withdraw(int amount){
        if (balance >= amount){
            balance -= amount;
            return true;
        }
        return false;
    }

    public boolean deposit(int amount){
        balance += amount;
        return true;
    }

}
