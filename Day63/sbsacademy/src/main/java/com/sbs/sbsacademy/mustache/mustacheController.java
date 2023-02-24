package com.sbs.sbsacademy.mustache;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class mustacheController {
    @GetMapping("/mustache")
    public String home(Model model){
//        model.addAttribute("user", new User("제니", 26));
//        return "";

//        model.addAttribute("name", "아이유");
//        model.addAttribute("age", "28");
//        model.addAttribute("company", "<b>HOJIN Co. </b>");
//        return "mustache/home";

//        model.addAttribute("user", false);
//        return "mustache/home";

//        List<String> names = new ArrayList<>();
//        names.add("지수");
//        names.add("제니");
//        names.add("로제");
//        names.add("리사");
//        model.addAttribute("name", names);
//        return "mustache/home";
//        List안에 데이터 모두출력

//        List<User> users = new ArrayList<>();
//        users.add(new User("지수", 28));
//        users.add(new User("제니", 27));
//        users.add(new User("로제", 22));
//        users.add(new User("리사", 25));
//        model.addAttribute("users", users);
//        return "mustache/home";
//        List안에 데이터 모두출력

//        model.addAttribute("person", new User("아이유", 28))

        List<User> users = new ArrayList<>();
        users.add(new User("지수", 28));
        users.add(new User("제니", 27));
        users.add(new User("로제", 22));
        users.add(new User("리사", 25));
        model.addAttribute("users", users);

        return "mustache/home";
    }
}
