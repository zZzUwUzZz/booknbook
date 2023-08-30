package com.cjcs.bnb.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.experimental.Accessors;


@Data
public class BookDto {

    // request객체파라미터명==필드명(==컬럼명) 이면 스프링이 알아서 객체생성해서 필드에다 파라미터값 넣어줌..
    // 우리는 지금 DTO와 Entity를 합쳐서 DTO만 쓰려고하므로 (==컬럼명) 까지 지켜주자..

    //테이블에 있는 필드
	private String b_s_id;         // 판매자아이디
	private String b_isbn;         // 책isbn 13자리(문자열)
	private String b_title;        // 책제목
	private String b_author;       // 책저자
	private String b_bookdesc;     // 책소개

	private String b_forsale;      // 판매여부(Y/N)
    private int b_price;           // 판매가
    private int b_salestock;       // 판매재고수량
    
    private String b_forrental;    // 대여여부(Y/N)
    private int b_rent;            // 대여료(7일기준)
    private int b_rentalstock;     // 대여재고수량

    private Timestamp b_regdate;      // 등록일자
    private String b_category_s_id;   // 소분류기호

    //뷰에만 있는 필드
    private String category_m_id;     // 중분류기호
    private String category_s;        // 소분류명
    private String category_m;        // 중분류명

	

}