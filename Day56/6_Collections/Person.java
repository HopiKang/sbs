public class Person implements Comparable<Person>{
    public String name;

    public int age;

    public Person(String name, int age){
        this.name = name;
        this.age = age;
    }

    public String toString(){
        return name + ": " + age + "세";
    }

    @Override
    public int compareTo(Person o){
        return age - o.age;
        // 현재인스턴스에서 다른인스턴스를 빼주는것
        // 나이순으로 정령
    }
}
