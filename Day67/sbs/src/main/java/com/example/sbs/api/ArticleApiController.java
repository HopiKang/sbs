package com.example.sbs.api;

import com.example.sbs.Dto.ArticleForm;
import com.example.sbs.Entity.Article;
import com.example.sbs.Repository.ArticleRepository;
import com.example.sbs.service.ArticleService;
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

    @Autowired
    private ArticleService articleService;


    /* service 배우기전
//    ArticleRepository 가져오기
    @Autowired
    private ArticleRepository articleRepository;
    */


//    List타입으로 전체조회하기
    @GetMapping("/api/articles")
    public List<Article> index(){
        return articleService.index();
    }

//    id값으로 조회하기
    @GetMapping("/api/articles/{id}")
//    PathVariable로 위 id 파라미터를 받아옴
    public Article indexId(@PathVariable Long id){
        return articleService.show(id);
    }


//    json으로 db에 데이터 주입하기
    @PostMapping("/api/articles")
    public ResponseEntity<Article> create(@RequestBody ArticleForm dto){
        Article created = articleService.create(dto);
        return (created != null) ?
                ResponseEntity.status(HttpStatus.OK).body(created) :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

//    수정 update patch로 실행
    @PatchMapping("api/articles/{id}")
    public ResponseEntity<Article> update(@PathVariable Long id, @RequestBody ArticleForm dto){
        Article updated = articleService.update(id, dto);
        return (updated != null) ?
                ResponseEntity.status(HttpStatus.OK).body(updated) :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }



//    삭제
    @DeleteMapping("api/articles/{id}")
    public ResponseEntity<Article> delete(@PathVariable Long id){
        Article deleted = articleService.delete(id);
        return (deleted != null) ?
                ResponseEntity.status(HttpStatus.NO_CONTENT).build() :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

    }


    //트렌젝션
    @PostMapping("/api/transaction-test")
    public ResponseEntity<List<Article>> trasactionTest(@RequestBody List<ArticleForm> dtos){
        List<Article> createList = articleService.createArticles(dtos);
        return (createList != null) ?
                ResponseEntity.status(HttpStatus.OK).body(createList):
                ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }


}
