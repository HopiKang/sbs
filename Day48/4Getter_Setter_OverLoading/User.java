public class User {
    private int age; // private은 홰당 클래스안에서만 사용할수있게 해준다
    private String name;
    private int cashAmount;
    private AccountNumber account;

    // getter,setter 메소드
    // BIN 규약 이다
    // setter는 private으로 선언된 필드의 값을 수정할때 필요하다
    // getter는 데이터를 읽어오는데 역할을 수행한다


    public int getAge() {
        return age;
    }

    public void setAge(int page) {
        this.age = page;
    }

    public String getName() {
        return name;
    }

    public void setName(String pname) {
        this.name = pname;
    }

    public int getCashAmount() {
        return cashAmount;
    }

    public void setCashAmount(int pcashAmount) {
        this.cashAmount = pcashAmount;
    }

    public AccountNumber getAccount() {
        return account;
    }

    public void setAccount(AccountNumber paccount) {
        this.account = paccount;
    }

    public boolean transfer(User to, int amount){
        return account.transfer(to.getAccount(), amount);
        // return account.transfer(to, amount); 로도 사용할수있다
    }

    public boolean transfer(AccountNumber to, int amount){
        return account.transfer(to, amount);
    }
}
