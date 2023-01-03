public class User {
    private int age; // private은 홰당 클래스안에서만 사용할수있게 해준다
    private String name;
    private int cashAmount;
    private AccountNumber account;

    /*
    User 2개를 만든다
    public User(String pName, int pAge)
    인스턴스 변수 cashAmount 0 으로 시작, 단 pAge 가 음수면 인스턴스 변수 age는 15로 설정
    */
    public User(String pName, int pAge, int pCashAmount){
        if (pAge < 0){
            age = 15;
        } else {
            age = pAge;
        }

        if (pCashAmount < 0){
            cashAmount = 0;
        } else {
            cashAmount = pCashAmount;
        }

        name = pName;
    }

    /*
    public User(String pName, int pAge, int pCashAmount)
    pAge 가 음수면 인스턴스 변수 age 는 15로 설정
    pCashAmount 가 음수면 인스턴스 변수 cashAmount 를 0으로 설정한다
    */
    public User(String pName, int pAge){
        if (pAge < 0){
            age = 15;
        } else {
            age = pAge;
        }
        name = pName;
        cashAmount = 0;
    }

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
