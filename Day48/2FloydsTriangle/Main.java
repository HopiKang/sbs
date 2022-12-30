public class Main {
    public static void main(String[] args) {

        DrawFloydsTriangle drawFloydsTriangle = new DrawFloydsTriangle();

        drawFloydsTriangle.drawFloydsTrianglePrint(3);
        System.out.println("------------------------");

        drawFloydsTriangle.drawFloydsTrianglePrint(6);
        System.out.println("------------------------");

        drawFloydsTriangle.drawFloydsTrianglePrint(15);
        System.out.println("------------------------");
    }
}