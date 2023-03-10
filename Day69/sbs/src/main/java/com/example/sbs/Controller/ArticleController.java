package com.example.sbs.Controller;

import com.example.sbs.Dto.ArticleForm;
import com.example.sbs.Entity.Article;
import com.example.sbs.Repository.ArticleRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Slf4j
public class ArticleController {

    @Autowired
    private ArticleRepository articleRepository;

    //    새글 작성
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

        return "redirect:/articles" + saved.getId();
    }

    //    게시판 하나 출력 id를 통해서
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

//    @GetMapping("/articles/{{id}}/edit")
//    public String edit(@PathVariable Long id, Model model){
//        Article articleEntity = articleRepository.findById(id).orElse(null);
//        model.addAttribute("article", articleEntity);
//        return "articles/edit";
//    }

//    도메인클래스로 만듬
//    @GetMapping("/articles/{{id}}/edit")
//    public String edit(@RequestParam("id") Article article, Model model){
//        Article articleEntity = articleRepository.findById(id).orElse(null);
//        model.addAttribute("article", articleEntity);
//        return "articles/edit";
//    }

    //    수정
    @PostMapping("/articles/update")
    public String update(ArticleForm form){
//        잘 출력되는지 확인
//        log.info(form.toString());

//        dto를 entity로 바꿔줌
        Article articleEntity = form.toEntity();
//        바꼈는지 확인
//        log.info(articleEntity.toString());
        Article target = articleRepository.findById(articleEntity.getId()).orElse(null);
//        로그확인
//        log.info(target.toString());

//        예외처리
        if (target != null){
//            데이터베이스에 저장
            articleRepository.save(articleEntity);
        }
        return ("redirect:/articles/" + articleEntity.getId());
    }

    @GetMapping("/articles/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes rttr){
//        삭제버튼을 누를시 확인
        log.info("삭제요청");
        Article target = articleRepository.findById(id).orElse(null);
//        받아온 데이터확인
        log.info(target.toString());

//        예외처리 데이터가 있는경우만
        if (target != null){
            articleRepository.delete(target);
//            잠시 사용할 메세지
            rttr.addFlashAttribute("msg", "삭제가 정상적으로 완료 되었습니다");
        }


//        삭제후 목록페이지로 돌아감
        return "redirect:/articles";
    }




    /*
     * gethandler
     * requestparameter
     * session
     * */
}
