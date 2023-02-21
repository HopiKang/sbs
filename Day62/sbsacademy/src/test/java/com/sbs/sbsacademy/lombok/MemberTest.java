package com.sbs.sbsacademy.lombok;

import org.junit.jupiter.api.Test;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

class MemberTest {

    @Test
    public void testBoard(){
        Board board1 = new Board();
        board1.setBoardNo(1);
        board1.setTitle("title1");

        Board board2 = new Board();
        board2.setBoardNo(2);
        board2.setTitle("title2");

        Board board3 = new Board();
        board3.setBoardNo(3);
        board3.setTitle("title3");

        Set<Board> boardSet = new HashSet<Board>();
        boardSet.add(board1);
        boardSet.add(board2);
        boardSet.add(board3);

        System.out.println("저장된 데이터의 수 : " + boardSet.size());

        Iterator<Board> it = boardSet.iterator();
        while (it.hasNext()){
            System.out.println(it.next());
        }
    }

    @Test
    public void testItem(){
        UserItem userItem1 = new UserItem();
        userItem1.setUserNo(1);
        userItem1.setItemId(300);
        userItem1.setDescription("사용자 아이템1");

        UserItem userItem2 = new UserItem();
        userItem2.setUserNo(1);
        userItem2.setItemId(400);
        userItem2.setDescription("사용자 아이템2");

        UserItem userItem3 = new UserItem();
        userItem3.setUserNo(1);
        userItem3.setItemId(400);
        userItem3.setDescription("사용자 아이템3");

        Set<UserItem> userItemSet = new HashSet<UserItem>();
        userItemSet.add(userItem1);
        userItemSet.add(userItem2);
        userItemSet.add(userItem3);

        System.out.println("저장된 데이터의 수 : " + userItemSet.size());

        Iterator<UserItem> it = userItemSet.iterator();
        while (it.hasNext()){
            System.out.println(it.next());
        }
    }

}