public class WordBank {
    public static void main(String[] args) {
        /*
        User user1 = new User();
        user1.setAge(28);
        // user1.getAge(-20); 실패한다
        System.out.println(user1.getAge());
        */

        User user1 = new User();
        user1.setName("아이유");
        user1.setAge(28);
        user1.setCashAmount(100000);

        AccountNumber accountNumber1 = new AccountNumber();
        accountNumber1.setBalance(100000);

        user1.setAccount(accountNumber1);
        accountNumber1.setOwner(user1);

        // 인스턴스 생성 "제니" "25살" "현금보유 100000"

        User user2 = new User();
        user2.setName("제니");
        user2.setAge(25);
        user2.setCashAmount(100000);

        AccountNumber accountNumber2 = new AccountNumber();
        accountNumber2.setBalance(500000);

        user1.setAccount(accountNumber2);
        accountNumber1.setOwner(user2);

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
