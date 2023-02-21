package com.sbs.sbsacademy;

import lombok.*;

@Getter
@Setter
@ToString(includeFieldNames = false)
public class Person {


//    private String name;
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }

//    을 보이지 않지만 컴파일할때 위처럼 만들어준다

//    @Getter
//    @Setter
//    private String name;

//    클래스위에도 사용할수있다


//    @Getter(AccessLevel.PRIVATE)
//    @Setter(AccessLevel.PRIVATE)
//    기본적으로 public


    private String name;
    private int age;

//    이미 이름이 같고 매개 변수의 수가 같은 메소드가 이미 존재한다면
//    메소드가 생성되지 않는다

    public Person(@NonNull String name, int age){
        if (name == null){
            throw new NullPointerException("Null");
        } else {
            this.name = name;
            this.age = age;
        }
    }

    @ToString.Exclude
    public static String type = "사람";

}
