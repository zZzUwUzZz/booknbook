package com.cjcs.bnb.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FavoriteDTO {
    private String favs_c_id;
    private String favs_s_id;
    private Date favs_date;
    private String s_storename;
    private int state;
    // 사진 이미지
    private String sf_sysname;
}
