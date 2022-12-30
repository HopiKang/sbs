public class AccountNumber {

    private int balance;
    private User owner;

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

// 송금을 성공하면 true를 리턴하고 실패하면 false를 리턴한다
// 송금금액이 amount가 음수일때 실패
// amount가 balance보다 클때도 실패
// 나의 balance를 amount만큼 줄이고 받는사람의 balance를 amount만큼 늘려라
// 송금이 되고나면 true-from: 송금인, to : 입금인, amount : 송금액, balance : 송금한사람의 잔고
// 송금이 안되고나면 false-from: 송금인, to : 입금인, amount : 송금액, balance : 송금한사람의 잔고
