package com.sbs.sbsacademy.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String title;
    @Column
    private String contant;

//    public Article(Long id, String title, String contant) {
//        this.id = id;
//        this.title = title;
//        this.contant = contant;
//    }
//
//    @Override
//    public String toString() {
//        return "Article{" +
//                "id=" + id +
//                ", title='" + title + '\'' +
//                ", contant='" + contant + '\'' +
//                '}';
//    }
//
//    public Article toEntity(){
//        return new Article(null, title, contant);
//    }

}
