public interface Shape {
    // interface
    // 일종의 계약서이다


    // 넓이
    double getArea();

    //둘레
    double getPerimeter();

    // getArea 와 getPerimeter 를 구현하지않으면 오류발생
    // 따로 열결되있기떄문에 public 을 적어주지 않아도된다

}
