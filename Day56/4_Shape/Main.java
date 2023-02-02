import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Shape> shapes = new ArrayList<>();
        // 인터페이스 Shape으로 ArrayList 생성

        shapes.add(new Circle(5.0));
        shapes.add(new Square(2.0));
        shapes.add(new Rectangle(4.0, 5.0));

        for (Shape shape : shapes){
            System.out.println("넓이 : " + shape.getArea());
        }
    }

    /*
    1 추상클래스는 추상 메소드를 포함한 클래스 입니다
    추상 메소드가 하나라도 있으면 추상 클래스로 만들어줘야 한다
    2 추상 클래스는 new(인스턴스화)를 할수없다
    3 추상 메소드가 없어도 클래스에 abstract를 사용하면 추상 클래스가된다
    4 추상 클래스 안에는 추상 메소드와 구혀된 메소드 둘다 존재 가능하다

    */
}
