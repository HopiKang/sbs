package com.example.sbs.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

// json을 반환함
// Controller 와 ResponseBody 를 합쳐놓은것이다
// Controller 와 ResponseBody 를 사용하면 json으로 반환한다
@RestController
public class FirstApiController {
    @GetMapping("api/hello")
    public String hello(){
        return "HelloFirstApi";
    }
}
