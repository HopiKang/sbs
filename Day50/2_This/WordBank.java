public class WordBank {
    public static void main(String[] args) {

        User user1 = new User("아이유", 28);
        user1.setCashAmount(30000);

        AccountNumber accountNumber1 = new AccountNumber(user1);
        accountNumber1.setBalance(100000);
        user1.setAccount(accountNumber1);

        User user2 = new User("제니", 25, 10000);
        AccountNumber accountNumber2 = new AccountNumber(500000, user2);
        user2.setAccount(accountNumber2);

        /*
        accountNumber2.deposit(50000);
        accountNumber2.withdraw(180000);
        accountNumber2.deposit(730000);
        accountNumber2.withdraw(700000);
        */

        //성공 제니 아이유 200000 300000
        accountNumber2.transfer(accountNumber1, 200000);
        //아이유 제니 150000 150000
        accountNumber1.transfer(user2, 150000);
        //제니 아이유 270000 180000
        user2.transfer(accountNumber1, 270000);
        //아이유 제니 130000 290000
        user1.transfer(user1, 130000);
    }
}
