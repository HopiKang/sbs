package com.sbs.sbsacademy.Repository;

import org.springframework.data.repository.CrudRepository;

public interface ArticleRepository extends CrudRepository<Article, Long> {
}


// 기본형의 경우, 레퍼 클래스를 지정한다는 점
// 클래스의 선언 앞에 @Repository 어노테이션을 붙여줘야
// JPA임을 알수있다
// @Query