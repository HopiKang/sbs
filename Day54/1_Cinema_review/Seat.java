public class Seat {

    private String name;

    public String getName(){return name;}
    //이건 어디에 쓰는지?
    //이건 밑에 match에 name.equals에 사용하는건가?

    public void reservation(String name){
        this.name = name;
    }
    // 예약자 이름 설정(고정?)
    // Seat클래스에 따로 빼놓은이유가 뭔지 모르겠음
    // Seat클래스에서 this.name으로 고정하면 LotteCinema에서도 영향을 주는가?

    // 취소
    public void cancel(){
        name = null;
        // 좌석에 저장된 이름을 null로 변경? 받아온 값의 이름을 null로 지정?
    }

    public boolean limited(){
        return name != null;
        // 좌석에 저장된 이름이 null값이 아닌경우 true
    }

    public boolean match(String checkName){
        return name.equals(checkName);
    }
}
