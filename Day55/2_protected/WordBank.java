import java.util.ArrayList;

public class WordBank {
    public static void main(String[] args) {
        AccountNumber an = new AccountNumber();
        MinBalanceAccount mba = new MinBalanceAccount();
        SaveInterestAccount sa = new SaveInterestAccount();

        ArrayList<AccountNumber> accounts = new ArrayList<>();

        an.deposit(1000);
        mba.deposit(1000);
        sa.deposit(1000);

        for (AccountNumber account : accounts){
            account.deposit(1000);

            if (account instanceof SaveInterestAccount){
                ((SaveInterestAccount) account).addInterest();
            }
        }
    }
}
