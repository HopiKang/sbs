public class Main {
    public static void main(String[] args) {
        B b = new B();
        b.a();

        C c = new C();
        c.a();

        D d = new D();
        d.a();

        E e = new E(1);
        e.a();

//        G g = new G();
//        g.a();

        H h = new H(1);
        h.a();

        I i = new I();
        i.a();
    }

}

class A{
    public A(){
        System.out.println("1");
    }
    public void a(){
        System.out.println("2");
    }
}

class B extends A{
}

class C extends A{
    public void a(){
        System.out.println("3");
    }
}

class D extends C{
    public void a(){
        System.out.println("4");
        super.a();
    }
}

class E extends A{
    public E(){
        System.out.println("5");
    }
    public E(int a){
        System.out.println("6");
    }
}

//class F{ // 기본생성자가 없음
//    public F(int a){
//        System.out.println("7");
//    }
//    public void a(){
//        System.out.println("8");
//    }
//}
//
//class G extends F{
//    public void a(){
//        super.a();
//        System.out.println("9");
//    }
//}

class H extends E{
    public H(int a){
        System.out.println("10");
    }
}

class I extends A {
    public I(){
        super();
        System.out.println("11");
//        super(); 오류 맨위로 올라가야함
    }
}