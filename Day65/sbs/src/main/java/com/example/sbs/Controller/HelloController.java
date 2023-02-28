package com.example.sbs.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {
    @GetMapping("/mvcfirst")
    public String hello(Model model){
        model.addAttribute("name", "Spring");
        return "mvcfirst";
    }

    @GetMapping("/headerfooter")
    public String headerfooterPage(){
        return "layout/index";
    }

    @GetMapping("/abc")
    public String index(){
        return "index";
    }
}
