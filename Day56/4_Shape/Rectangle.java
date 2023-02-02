public class Rectangle implements Shape{
    double side1;

    double side2;

    public Rectangle(double side1, double side2){
        this.side1 = side1;
        this.side2 = side2;
    }

    // 넓이
    public double getArea(){
        return side1 * side2;
    }

    // 둘레
    public double getPerimeter(){
        return 2 * (side1 * side2);
    }
}
