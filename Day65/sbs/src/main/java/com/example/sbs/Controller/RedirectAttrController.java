package com.example.sbs.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
public class RedirectAttrController {
    @GetMapping("/redirectattr")
    public String getRedirectAttr(Model model){
        model.addAttribute("name", "아이유");
        model.addAttribute("age", 29);
        return "redirect:/redirect";
    }
}
