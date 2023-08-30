package com.cjcs.bnb.dto;

import lombok.Data;


@Data
public class CartDto {
    
    //Cart테이블에 있는 필드
    private String cart_c_id;         // 구매자아이디
    private String cart_s_id;         // 판매자아이디
    private String cart_b_isbn;       // 책ISBN
    private String cart_sort;         // 주문종류(구매or대여)
    private int cart_amount;          // 구매수량(대여인 경우 1권만 가능)
    private int cart_rentalperiod;    // 대여기간(대여인 경우만 입력, 7or14)
    
}
