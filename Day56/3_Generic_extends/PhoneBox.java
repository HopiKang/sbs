public class PhoneBox<T extends Phone> extends Box<T>{
    // T는 Phone클래스의 자식이여야만 한다
    public void airpot(String numberString){
        getSomething().call();

        PhoneBox<AndroidPhone> phoneBox = new PhoneBox();
        AndroidPhone androidPhone = phoneBox.getSomething();
        phoneBox.airpot("전화가 왔습니다");
    }
}
