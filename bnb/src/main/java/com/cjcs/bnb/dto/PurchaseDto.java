package com.cjcs.bnb.dto;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class PurchaseDto {
    
    //주문항목공통 필드
    private int o_id;                 // 주문번호
    private String o_c_id;            // 구매자아이디
    private Timestamp o_date;         // 주문일시
    private String o_delivery_sort;   // 배송방법(택배or방문수령)
    private String o_recip_addr;      // 배송지주소
    private String o_recip_name;      // 수령인
    private String o_recip_phone;     // 수령인연락처

    //구매항목만 가지는 필드
    private int p_id;                 // 구매항목번호
    private String p_s_id;            // 판매자아이디
    private String p_b_isbn;          // 책ISBN
    private String p_c_id;            // 구매자아이디
    private int p_amount;             // 구매수량

    private int p_order_status_id;                   // 주문상태코드(숫자1자리)
    private String p_ordercancel_rejection_reason;   // 주문취소불가사유

    private int p_delivery_status_id;                // 배송상태코드(숫자1자리)
    private Timestamp p_deliverydate;                // 배송완료일

    //뷰에만 있는 필드
    private int b_price;               // 판매단가
    private String s_storename;        // 서점명
    private String b_title;            // 도서명
    private String order_status;       // 주문상태(주문완료/취소요청/취소불가/취소완료)
    private String delivery_status;    // 배송상태(결제완료/상품준비중/상품준비완료/수령완료/배송준비중/배송중/배송완료)

}
