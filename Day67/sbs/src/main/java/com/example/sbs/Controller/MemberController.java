package com.example.sbs.Controller;

import com.example.sbs.lombok.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Slf4j
@Controller
public class MemberController {
    @GetMapping("/registerForm")
    public String registerForm(Model model) {
        log.info("registerForm");

        com.example.sbs.lombok.Member member = new com.example.sbs.lombok.Member();
        member.setUserId("innovation");
        member.setUserName("아이유");

        model.addAttribute("member", member);

        return "registerForm";
    }

    @PostMapping("/register")
    public String register(Member member){


        log.info("register");
        log.info("member.getUserid() = " + member.getUserId());
        log.info("member.getUserName() = " + member.getUserName());

//        메세지출력
        return "redirect:/result";
    }
}
