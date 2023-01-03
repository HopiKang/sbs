public class AccountNumber {
    private int balance;
    private User owner;

    public AccountNumber(int pBalance){
        if (pBalance < 0){
            balance = 0;
        } else {
            balance = pBalance;
        }
    }

    public AccountNumber(User pOwner){
        owner = pOwner;
        balance = 0;
    }

    public AccountNumber(int pBalance, User pOwner){
        if (pBalance < 0){
            balance = 0;
        } else {
            balance = pBalance;
        }

        owner = pOwner;
    }

    public int getBalance(){
        return balance;
    }
    public void setBalance(int pBalance){
        balance = pBalance;
    }
    public User getOwner(){
        return owner;
    }
    public void setOwner(User powner){
        owner = powner;
    }

    // 파라미터로 입금할 액수를 받아 온다
    boolean deposit(int amount){
        if (amount < 0 || owner.getCashAmount() < amount){
            System.out.println("입금에 실패 하였습니다. 잔고 :" + balance + "원, 현금" + owner.getCashAmount());
            return false;
        }
        balance += amount;
        owner.setCashAmount(owner.getCashAmount() - amount);

        System.out.println(amount + "원이 입금되었습니다. 잔고 :" + balance + "원, 현금" + owner.getCashAmount());
        return false;
    }

    // 파라미터로 출금할 액수를 받아온다
    boolean withdraw(int amount){
        if(amount < 0 || balance < amount){
            System.out.println("출금에 실패 하였습니다. 잔고 :" + balance + "원, 현금" + owner.getCashAmount());
            return false;
        }
        balance -= amount;
        owner.setCashAmount(owner.getCashAmount() + amount);

        System.out.println(amount + "원이 출금되었습니다. 잔고 :" + balance + "원, 현금" + owner.getCashAmount());
        return false;
    }

    boolean transfer(User to, int amount){
        return transfer(to.getAccount(), amount);
    }

    boolean transfer(AccountNumber to, int amount){
        boolean success;

        if (amount < 0 || amount > balance){
            success = false;
        } else {
            balance -= amount;
            to.balance += amount;
            success = true;
        }

        System.out.println(success + "from : " + owner.getName() + ", to :" + to.owner.getName()
                + ", amount :" + amount + ", balance :" + balance);
        return success;
    }
}
