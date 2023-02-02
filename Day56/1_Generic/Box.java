public class Box<T> { // <T>는 타입 파라미터이다 이 타입 파라미터를 받는 클래스를 제네릭 클래스라 한다
    // 제네릭 Generic
    // java 5 부터 사용되기 시작했다
    // 하나의 자료형이 아니라 여러 자료형을 이용해서 프로그래밍을 할 수 있는 기법


//    private Object something;
    // Object는 모든 클래스의 부모클래스이다
    private T something;


//    public Object getSomething(){
    public T getSomething(){
        return something;
    }

    public void setSomething(T something){
        this.something = something;
    }

    public static void main(String[] args) {
        Box<Phone> box = new Box<>();
        Phone phone = new Phone();
        box.setSomething(phone);

        Phone unboxed = box.getSomething();
    }


    // 제네릭이란 <> 이다
    // ArrayList<String> list = new ArrayList<>();
    // ArrayList list = new ArrayList<>(); , ArrayList list = new ArrayList();
    // 이렇게써도 이상이없다
    // ArrayList list = new ArrayList();
    // list.add("안녕하세요");
    //
}
