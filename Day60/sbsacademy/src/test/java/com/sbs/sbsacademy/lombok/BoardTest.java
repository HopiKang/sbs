package com.sbs.sbsacademy.lombok;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class BoardTest {
    @Test
    public void testSetter(){
        Board board = new Board();
        board.setTitle("게시판을 만들고 있습니다");
        System.out.println(board.getTitle());
    }

    @Test
    public void testLever1(){

    }
}