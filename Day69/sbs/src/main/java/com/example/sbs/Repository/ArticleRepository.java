package com.example.sbs.Repository;

import com.example.sbs.Entity.Article;
import org.springframework.data.repository.CrudRepository;

import java.util.ArrayList;

public interface ArticleRepository extends CrudRepository<Article, Long>{
    @Override
    ArrayList<Article> findAll();

}


