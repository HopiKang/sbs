public class Pokemon {
    // HashMap
    // 여러 객체를 모아 담을 수 있는 자료형
    // 원소(value)와 키(key) 쌍으로 이루어져있다

    public final String name;

    public Pokemon(String name){
        this.name = name;
    }

    public String toString(){
        return name;
    }
}
