package com.sbs.sbsacademy.lombok;

import lombok.*;
import org.springframework.cglib.core.Local;

import java.time.LocalDateTime;


@RequiredArgsConstructor
@ToString
public class Board {
    @NonNull
    private int boardNo;
    private String title;
    private String writer;
    private String content;
    private LocalDateTime regDate;

//    public Board(int boardNo){
//        super();
//        this.boardNo = boardNo;
//    }
}
