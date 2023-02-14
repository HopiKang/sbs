package com.sbs.sbsacademy.lombok;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.cglib.core.Local;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "boardNo")
public class Board {
    private int boardNo;
    private String title;
    private String writer;
    private String content;
    private LocalDateTime regDate;

}
