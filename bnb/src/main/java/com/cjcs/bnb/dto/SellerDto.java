package com.cjcs.bnb.dto;

import lombok.Data;

@Data
public class SellerDto {

    // 서점 관련 정보
    private String s_id;
    private String s_storename;
    private String s_storedesc;
    private String s_crn;
    private int s_deliveryfee;
    private int s_latefee;

}
