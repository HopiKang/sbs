package com.example.sbs.Entity;

import jakarta.persistence.*;
import org.springframework.data.jpa.repository.Lock;

@Entity
@NamedQuery(name = "User.findByName", query = "select u from User u where u.name = :name")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String email;
}

// EntityManager.createNamedQuery() 를 호출하게됨
