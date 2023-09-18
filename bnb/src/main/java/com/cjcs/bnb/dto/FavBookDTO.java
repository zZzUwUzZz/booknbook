package com.cjcs.bnb.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FavBookDTO {
    private String favb_c_id; // 구매자 아이디
    private String favb_s_id; // 판매자 아이디
    private String favb_b_isbn; // 책 ISBN
    private int fav_state; // 찜하기 상태 (0: 찜 안 함, 1: 찜 함)

    public FavBookDTO(String favb_c_id, String favb_s_id, String favb_b_isbn) {
        this.favb_c_id = favb_c_id;
        this.favb_s_id = favb_s_id;
        this.favb_b_isbn = favb_b_isbn;
    }
}
