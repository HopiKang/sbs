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

            shape.move(5, 8);
            System.out.println("X : " + shape.getX() + ", Y : " + shape.getY());
            shape.move(-50, 10);
            System.out.println("X : " + shape.getX() + ", Y : " + shape.getY());
        }


    }

    /*
    추상클래스
    1 추상클래스는 추상 메소드를 포함한 클래스 입니다
    추상 메소드가 하나라도 있으면 추상 클래스로 만들어줘야 한다
    2 추상 클래스는 new(인스턴스화)를 할수없다
    3 추상 메소드가 없어도 클래스에 abstract를 사용하면 추상 클래스가된다
    4 추상 클래스 안에는 추상 메소드와 구혀된 메소드 둘다 존재 가능하다


    implements 와 extends 의 차이
    1 extends 는 일반 클래스와 abstract 클래스 상속에 사용한다
    그리고 implement 는 interface 상속에 사용된다
    2 클래스가 클래스를 상속 받을때 extends 를 사용해야한다
    interface 를 상속 받을땐 extends를 사용한다
    3 클래스가 interface 를 사용할때는 implements 를 사용해야한다
    4 interface 가 클래스를 사용할때는 implements 를 사용할수없다
    5 extends 는 클래스 한개만 상속받을 수 있다
    왜냐면 "내부적으로 Object 클래스를 기본적으로 상속받고있기때문이다"
    6 extends 자식 클래스는 부모 클래스의 기능을 사용한다
    7 implements 는 여러개 사용가능하다 그리고 계약서 설계용으로 많이 사용된다
    8 implements 한 클래스는 implements 의 내용을 모두 사용해야한다
    */
}
