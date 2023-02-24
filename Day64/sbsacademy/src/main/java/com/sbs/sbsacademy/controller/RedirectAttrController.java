package com.sbs.sbsacademy.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
public class RedirectAttrController {
//    @GetMapping("/redirectattr")
//    public String getRedirectAttr(RedirectAttributes rttr){
//        rttr.addAttribute("name", "아이유");
//        rttr.addAttribute("age", 29);
//        return "redirect:/redirect";
//    }

    @GetMapping("/redirectattr")
    public String getRedirectAttr(Model model){
        model.addAttribute("name", "아이유");
        model.addAttribute("age", 29);
        return "redirect:/redirect";
    }

//    flashattributes 도 사용가능하다
//    @GetMapping("/flashattributes")
//    public String getRedirectAttr(Redirect rttr){
//        User user = new User();
//        rttr.addFlashAttribute("age", 29);
//        return "redirect:/redirect";
//    }


    @GetMapping("/redirect")
//    바디에 담아서
    @ResponseBody
    public String redirect(@RequestParam String name, @RequestParam int age){
        log.info(name + " " + age);
        return "성공";
    }
}
