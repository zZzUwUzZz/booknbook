package com.cjcs.bnb.dto;

import java.sql.Date;
 
import lombok.Data;

@Data
public class FavoriteDTO {
    private String favs_c_id;
    private String favs_s_id;
    private Date favs_date;
    private int state;
}
