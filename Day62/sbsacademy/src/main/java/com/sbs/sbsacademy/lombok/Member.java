package com.sbs.sbsacademy.lombok;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;


@RequiredArgsConstructor
@ToString(exclude = "userName")
public class Member {
    private final String userId;
    private final String password;
    private final String userName;

//    public Member(String userId, String password){
//        super();
//        this.userId = userId;
//        this.password = password;
//    }

}
