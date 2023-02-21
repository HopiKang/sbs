package com.sbs.sbsacademy.controller;

import com.sbs.sbsacademy.entity.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

// redirect 사용법
@Slf4j
@Controller
public class MemberController {
    @GetMapping("/registerForm")
    public String registerForm(){
        return "registerForm";
    }

    @PostMapping("/register")
    public String register(Member member, RedirectAttributes rtts){
        rtts.addFlashAttribute("msg", "success");
//        메세지출력
        return "redirect:/result";
    }

    @GetMapping("/result")
    public String result(){
        return "result";
    }
}
