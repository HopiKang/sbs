package com.example.sbs.Dto;

import com.example.sbs.Entity.Article;
import lombok.AllArgsConstructor;
import lombok.ToString;

import java.security.PrivateKey;
import java.util.PrimitiveIterator;

@AllArgsConstructor
@ToString
public class ArticleForm {
    private Long id;
    private String title;
    private String content;

    public ArticleForm(String title, String content){
        this.title = title;
        this.content = content;
    }

    public Article toEntity(){
        return new Article(id, title, content);
    }
}
