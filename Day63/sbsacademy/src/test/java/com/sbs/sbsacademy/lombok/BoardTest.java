package com.sbs.sbsacademy.lombok;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class BoardTest {
//    @Test
//    public void testSetter(){
//        Board board = new Board();
//        board.setTitle("게시판을 만들고 있습니다");
//        System.out.println(board.getTitle());
//    }

//    @Test
//    public void testLever1(){
//
//    }
//
//    @Test
//    public void testNoArgsConstructor(){
//        Member member = new Member();
//
//        System.out.println(member);
//    }

    @Test
    public void testRequiredArgsConstructor(){
        Member member = new Member("userId", "password", "username");
        System.out.println(member);
    }
}