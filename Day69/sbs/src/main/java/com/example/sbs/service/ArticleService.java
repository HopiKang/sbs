package com.example.sbs.service;

import com.example.sbs.Dto.ArticleForm;
import com.example.sbs.Entity.Article;
import com.example.sbs.Repository.ArticleRepository;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class ArticleService{

    @Autowired
    private ArticleRepository articleRepository;

    public List<Article> index(){
        return articleRepository.findAll();
    }

    public Article show(Long id){
        return articleRepository.findById(id).orElse(null);
    }

    public Article create(ArticleForm dto){
        Article article = dto.toEntity();
        // 업데이트되는걸 막아줌
        if (article.getId() != null){
            return null;
        }
        return articleRepository.save(article);
    }

    public Article update(Long id, ArticleForm dto){
        Article article = dto.toEntity();
        log.info("id: {}, article: {}", id, article.toString());
        Article target = articleRepository.findById(id).orElse(null);
        if (target != null || id != article.getId()){
            log.info("잘못된 요청이 들어왔습니다. id: {}, article: {}", id, article.toString());
            return null;
        }
        target.patch(article);
        Article updated = articleRepository.save(target);
        return updated;
    }

    public Article delete(Long id){
        Article target = articleRepository.findById(id).orElse(null);
        if (target == null){
            return null;
        }
        articleRepository.delete(target);
        return target;
    }

//    오류 발생시 다시 롤백을 실행함
    @Transactional
    public List<Article> createArticles(List<ArticleForm> dtos){
        // dto -> entity 묶음으로 변환
        List<Article> articlesList = dtos.stream()
                .map(dto -> dto.toEntity())
                .collect(Collectors.toList());

        // entity 데이터 베이스에 저장
        articlesList.stream()
                .forEach(article -> articleRepository.save(article));

        // 예외 발생
        articleRepository.findById(-1L).orElseThrow(
                () -> new IllegalArgumentException("실패 하였습니다")
        );

        // 결과값 반환
        return null;
    }

}
