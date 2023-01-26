public class TransferLimitAccountNumber extends AccountNumber{
    private int transferLimit;

    @Override
    boolean withdraw(int amount){
        if (amount > transferLimit){
            return  false;
        }
        return super.withdraw(amount); // 부모클래스의 메소드, 변수를 사용할때
    }

    public TransferLimitAccountNumber(int balance, int transferLimit){
        super(balance); // 부모클래스의 생성자를 사용할때
        this.transferLimit = transferLimit;
    }
}
