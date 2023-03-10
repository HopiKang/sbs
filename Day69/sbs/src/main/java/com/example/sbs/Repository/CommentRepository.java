package com.example.sbs.Repository;

import com.example.sbs.Entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    @Query(value = "select * from comment where article_id = :articleId", nativeQuery = true)
    List<Comment> findByArticleId(@Param("articleId") Long articleId);
}
