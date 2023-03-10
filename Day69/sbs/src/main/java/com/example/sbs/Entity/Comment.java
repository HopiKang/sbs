package com.example.sbs.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
//    부모게시글관련 기사하나에 여러개의 댓글
    @ManyToOne
//    외래키
    @JoinColumn(name = "article_id")
    private Article article;
    @Column
    private String nickname;
    @Column
    private String boby;
}
