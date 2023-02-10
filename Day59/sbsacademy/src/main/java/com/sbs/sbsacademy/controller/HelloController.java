package com.sbs.sbsacademy.controller;

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
        return "layouts/headerfooter";
    }
}
