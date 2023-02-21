package com.sbs.sbsacademy.lombok;

import lombok.*;

@AllArgsConstructor
@RequiredArgsConstructor(staticName = "")
@Getter
@Setter
@ToString
public class User {
//    final private String name;
    private String name;
    private int age;
//    @NonNull private String company;
}

/*
public User(final String name, final int age, @NonNull final String company){
    if (company == null){
        throw
    } else {
        this.age = age;
    }
}
이런식으로 볼수있다
 */