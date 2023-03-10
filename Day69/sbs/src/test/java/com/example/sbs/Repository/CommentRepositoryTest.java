package com.example.sbs.Repository;

import com.example.sbs.Entity.Article;
import com.example.sbs.Entity.Comment;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CommentRepositoryTest {

    @Autowired
    CommentRepository commentRepository;

    @Test
    @DisplayName("댓글조회")
    void findByArticleId(){
        {
            Long articleId = 1L;

            List<Comment> comments = commentRepository.findByArticleId(articleId);

            Article article = new Article(1L, "아이유", "가수탤런트");
            Comment a = new Comment(1L, article, "동네 아저씨", "언니 너무 귀여워요");
            Comment b = new Comment(2L, article, "포켓걸 이에요", "낭만 자객");
            Comment c = new Comment(3L, article, "우유빛깔 아이유", "팬클럽회장");

            List<Comment> expected = Arrays.asList(a, b, c);
            assertEquals(expected.toString(), comments.toString(), "1번글의 모든출력");
        }
    }
}