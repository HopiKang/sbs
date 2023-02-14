package com.sbs.sbsacademy.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Slf4j
@Controller
public class UserUrlController {

    @GetMapping("/urlQueryForm")
    public String registerForm(){
        log.info("urlQuryForm");
        return "urlQuryForm";
    }

    @GetMapping("/register")
    public String parameterUserQuery(String userId, String password){
        log.info("parameterUserQuery");
        log.info("userId = " + userId);
        log.info(("password = " + password));

        return "success";
    }

    @GetMapping("/register/{userId}")
    public String pathVariableUserQuery(@PathVariable String userId){
        log.info("pathVariableUserQuery");
        log.info("userId = " + userId);

        return "success";
    }
}
