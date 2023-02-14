package com.sbs.sbsacademy.controller;

import com.sbs.sbsacademy.Repository.ArticleRepository;
import com.sbs.sbsacademy.dto.ArticleForm;
import com.sbs.sbsacademy.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ArticleController {
    @Autowired
    private ArticleRepository articleRepository;

    @GetMapping("articles/new")
    public String newDtoForm(){
        return "articles/new";
    }

    @PostMapping("/articles/create")
    public String createAricle(ArticleForm form){
        System.out.println(form.toString());

        Article article = form.toEntity();
        System.out.println(form.toString());
        Article saved = articleRepository.save(article);
        System.out.println(saved.toString());
        return "";
    }
}
