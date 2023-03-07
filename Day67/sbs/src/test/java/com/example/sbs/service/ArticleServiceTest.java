package com.example.sbs.service;

import com.example.sbs.Dto.ArticleForm;
import com.example.sbs.Entity.Article;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

// Springboot와 연동되서 테스트 가능
@SpringBootTest
class ArticleServiceTest {
    // 전체출력
    @Autowired
    ArticleService articleService;
    @DisplayName("전체리스트 테스트")
    @Test
    void index(){
        Article a1 = new Article(5L, "우리나라만세", "우크라이나힘내");
        Article b1 = new Article(6L, "가나다라", "아자차카");
        Article c1 = new Article(7L, "1111", "2222");
        List<Article> expected = new ArrayList<>(Arrays.asList(a1, b1, c1));

        List<Article> articles = articleService.index();

        assertEquals(expected.toString(), articles.toString());
    }

    @Test
    void show_success_존재하는ID(){
        Long id = 5L;
        Article expected = new Article(5L, "우리나라만세", "우크라이나힘내");

        Article article = articleService.show(id);

        assertEquals(expected.toString(), article.toString());
    }

    @Test
    void show_fail_존재하지않는ID(){
        Long id = -5L;
        Article expected = null;

        Article article = articleService.show(id);

        assertEquals(expected, article);
    }

    @Test
    @DisplayName("Create 테스트")
    void create(){
        String title = "DB에 자동 생성 ID값을 현재 알 수 없음";
        String content = "ID값을 예상값으로 테스트";
        ArticleForm dto = new ArticleForm(null, title, content);

        Article expected = new Article(20L, title, content);

        Article article = articleService.create(dto);

        assertEquals(expected.toString(), article.toString());
    }
}