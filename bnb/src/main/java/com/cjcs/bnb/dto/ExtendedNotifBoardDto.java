package com.cjcs.bnb.dto;

import lombok.Data;

@Data
public class ExtendedNotifBoardDto extends NotifBoardDto {
    private String s_storename;
    private String b_title;
    private String b_isbn;
    private String b_s_id;
}