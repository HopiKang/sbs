package com.sbs.sbsacademy.lombok;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of = {"userNO, itemId"})
public class UserItem {
    private int userNo;
    private int itemId;
    private String itemName;
    private Integer price;
    private String description;
}
