package com.sbs.sbsacademy.mustache;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class mustacheController {
    @GetMapping("/mustache")
    public String home(Model model){
        model.addAttribute("user", new User("제니", 26));
        return "mustache/home";
    }
}
