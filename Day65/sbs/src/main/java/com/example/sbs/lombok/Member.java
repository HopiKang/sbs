package com.example.sbs.lombok;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@RequiredArgsConstructor
@ToString
@Getter
@Setter
public class Member {
    private String userId;
    private String userName;
}
