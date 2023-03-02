package com.example.sbs.api;

import com.example.sbs.Dto.ArticleForm;
import com.example.sbs.Entity.Article;
import com.example.sbs.Repository.ArticleRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

// json 형태로 반환햊줌
@RestController
@Slf4j
public class ArticleApiController {
//    ArticleRepository 가져오기
    @Autowired
    private ArticleRepository articleRepository;
//    List타입으로 전체조회하기
    @GetMapping("/api/articles")
    public List<Article> index(){
        return articleRepository.findAll();
    }

//    id값으로 조회하기
    @GetMapping("/api/articles/{id}")
//    PathVariable로 위 id 파라미터를 받아옴
    public Article indexId(@PathVariable Long id){
        return articleRepository.findById(id).orElse(null);
    }

//    json으로 db에 데이터 주입하기
    @PostMapping("/api/articles")
    public Article create(@RequestBody ArticleForm dto){
        Article article = dto.toEntity();
        return articleRepository.save(article);
    }

//    수정 update patch로 실행
    @PatchMapping("api/articles/{id}")
    public ResponseEntity<Article> update(@PathVariable Long id, @RequestBody ArticleForm dto){
        Article article = dto.toEntity();
        log.info("id : {}", "article: {}", id, article.toString());

        Article target = articleRepository.findById(id).orElse(null);
        if (target == null || id != article.getId()){
            log.info("잘못된 요청의 id : {}", "ARTICLE:{}", id, article.toString());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
//        title 이나 content 칸이 비었을경우
//        Entity 패키지에 patch 메서드추가
        target.patch(article);
        Article update = articleRepository.save(target);
        return ResponseEntity.status(HttpStatus.OK).body(update);
    }

//    삭제
    @DeleteMapping("api/articles/{id}")
    public ResponseEntity<Article> dalete(@PathVariable Long id){
        Article target = articleRepository.findById(id).orElse(null);

        if (target == null){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        articleRepository.delete(target);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

}
