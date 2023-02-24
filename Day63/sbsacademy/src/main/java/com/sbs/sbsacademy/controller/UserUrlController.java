package com.sbs.sbsacademy.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
public class UserUrlController {

    @GetMapping("/urlQueryForm")
    public String registerForm(){
        log.info("urlQueryForm");
        return "urlQueryForm";
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

    @PostMapping("/form02")
    public String form02(String password, String userId, int money){
        log.info("form02");
        log.info("userId = " + userId);
        log.info("password = " + password);

        return "success";
    }

    @PostMapping("/form03")
    public String form03(@RequestParam("userId") String username){
        log.info("userId = " + username);

        return "success";
    }
}
