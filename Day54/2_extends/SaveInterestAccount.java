public class SaveInterestAccount extends AccountNumber{
    //  AccountNumber의 속성과 기능을 모두 상속 받는다

    private double interes;

    private void setInteres(double interes){
        this.interes = interes;
    }

    public double getInteres(0){
        return interes;
    }

    public void addInterest(){
        setBalance((int) (getBalance() * (1 + interes)));
//        balance = (int) (balance * (1 + interes));
//        balance 변수는 private 선언이 되있기때문에 메서드로 가져온다
    }
}
