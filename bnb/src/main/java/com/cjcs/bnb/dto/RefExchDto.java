package com.cjcs.bnb.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RefExchDto {
    
    //테이블에 있는 필드
    private int re_id;            // 교환반품신청번호
    private int re_o_id;          // 구매자아이디
    private String re_s_id;       // 판매자아이디
    private String re_b_isbn;     // 책ISBN

    private String re_sort;              // 구분(교환or반품)
    private String re_reason;            // 교환반품신청사유
    private int re_amount;               // 신청수량
    private Timestamp re_reqdate;        // 신청일자
    private int re_process_status_id;    // 처리상태코드(숫자1자리)
    private String re_rejection_reason;  // 교환반품불가사유

    //뷰에만 있는 필드
    private String s_storename;       // 서점명
    private String b_title;           // 책제목
    private int b_price;              // 판매단가
    private String process_status;    // 처리상태

}
