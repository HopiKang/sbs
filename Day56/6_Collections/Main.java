import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

public class Main {
    //Comparable interface

    public static void main(String[] args) {
        ArrayList<Person> integerList = new ArrayList<>();
        integerList.add(new Person("아이유",15));
        integerList.add(new Person("제니",8));
        integerList.add(new Person("문채원",5));
        integerList.add(new Person("손나은",20));
        Collections.sort(integerList);
        System.out.println(integerList);
    }
}
