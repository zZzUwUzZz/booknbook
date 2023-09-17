package com.cjcs.bnb.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NotifBoardDto {
    private String nb_m_id;
    private String nb_msg;
    private Date nb_date;
    private String nb_read;
}