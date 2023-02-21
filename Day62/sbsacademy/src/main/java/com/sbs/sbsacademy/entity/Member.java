package com.sbs.sbsacademy.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.bind.annotation.GetMapping;

@Getter
@Setter
@ToString
public class Member {
    private String userId;
    private String password;
}
