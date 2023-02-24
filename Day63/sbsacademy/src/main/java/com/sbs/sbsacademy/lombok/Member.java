package com.sbs.sbsacademy.lombok;

import lombok.*;


@RequiredArgsConstructor
@ToString
@Getter
@Setter
public class Member {
    private String userId;
    private String userName;

//    public Member(String userId, String password){
//        super();
//        this.userId = userId;
//        this.password = password;
//    }

}
