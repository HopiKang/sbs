public class Seat {
    private String name; //예약자이름

    public String getName(){
        return name;
    }

    // 예약자 이름설정
    public void reservation(String name){
        this.name = name;
    }

    // 취소
    public void cancel(){
        name = null;
    }

    public boolean limited(){
        return name != null;
    }

    //예약자가 맞는지 확인
    public boolean match(String checkName){
        return name.equals(checkName);
    }


}
