package com.cjcs.bnb.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BookDto {

    // 테이블에 있는 필드
    private String b_s_id;       // 판매자아이디
    private String b_isbn;       // 책isbn 13자리(문자열)
    private String b_title;      // 책제목
    private String b_author;     // 책저자
    private String b_bookdesc;   // 책소개

    private String b_forsale;    // 판매여부(Y/N)
    private int b_price;         // 판매가
    private int b_salestock;     // 판매재고수량

    private String b_forrental;  // 대여여부(Y/N)
    private int b_rent;          // 대여료(7일기준)
    private int b_rentalstock;   // 대여재고수량

    private Timestamp b_regdate;    // 등록일자
    private String b_category_s_id; // 소분류기호

    // 뷰에만 있는 필드
    private String s_storename;     // 서점명
    private String category_m_id;   // 중분류기호
    private String category_s;      // 소분류명
    private String category_m;      // 중분류명

}