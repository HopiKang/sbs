public class Box<T> {
    // generic extenstion

    private T something;

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
}
