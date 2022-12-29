public class AccountNumber {
    int balance;

    User owner;

    //파라미터로 입금할 액수를 받아온다
    boolean deposit(int amount){
        if (amount < 0 || owner.cashAmount < amount){
            System.out.println("입금이 실패 하였습니다." + balance + "원, 현금" + owner.cashAmount);
            return false;
        }
        balance += amount;
        owner.cashAmount += amount;

        System.out.println(amount + "원이 입금되었습니다. 잔고 :" + balance + "원, 현금" + owner.cashAmount);
        return false;
    }

    //파라미터로 입금할 액수를 받아온다
    //리턴할값을 boolean자료형으로 한다
    boolean withdraw(int amount){
        if (amount < 0 || balance < amount){
            System.out.println("출금이 실패 하였습니다." + balance + "원, 현금" + owner.cashAmount);
        }
        balance -= amount;
        owner.cashAmount += amount;

        System.out.println(amount + "원이 출금 되었습니다. 잔고 :" + balance + "원, 현금" + owner.cashAmount);
        return false;
    }

//    boolean transfer(User to, int amount){
//
//
//    }
}
