public class Circle extends Shape{
    public final double PI = 3.14;

    double radius;

    public Circle(double radius){
        this.radius = radius;
    }

    // 넓이
    public double getArea(){
        return PI * radius * radius;
    }

    // 둘레
    public double getPerimeter(){
        return 2 * PI * radius;
    }
}
