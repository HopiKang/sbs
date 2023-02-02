public abstract class Shape {
    // interface
    // 일종의 계약서이다


    // 넓이
    public abstract double getArea();

    //둘레
    public abstract double getPerimeter();

    private double x, y;

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public void move(double x, double y){
        this.x = x;
        this.y = y;
    }

    // getArea 와 getPerimeter 를 구현하지않으면 오류발생
    // 따로 열결되있기떄문에 public 을 적어주지 않아도된다

}
