package com.sbs.sbsacademy.controller;

import com.sbs.sbsacademy.Repository.ArticleRepository;
import com.sbs.sbsacademy.dto.ArticleForm;
import com.sbs.sbsacademy.entity.Article;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@Slf4j
public class ArticleController {
    @Autowired
    private ArticleRepository articleRepository;

    @GetMapping("/articles/new")
    public String newDtoForm(){
        return "articles/new";
    }

    @PostMapping("/articles/create")
    public String createArticle(ArticleForm form){
        log.info(form.toString());

        Article article = form.toEntity();
        log.info(form.toString());

        Article saved = articleRepository.save(article);
        log.info(saved.toString());

        return "";
    }

//    게시판 하나 출력
    @GetMapping("/articles/{id}")
//    {id}부분에 데이터베이스 id값을 넣으면된다
    public String show(@PathVariable Long id, Model model){
//        log.info("id = " + id);
        Article articleEntity = articleRepository.findById(id).orElse(null);
        model.addAttribute("article", articleEntity);
        return "articles/show";
    }

//    게시판 모두출력
    @GetMapping("/articles/all")
    public String index(@PathVariable Model model){
        List<Article> articleEntityList = articleRepository.findAll();
        model.addAttribute("articlesList", articleEntityList);
        return "/articles/index";
    }
}
