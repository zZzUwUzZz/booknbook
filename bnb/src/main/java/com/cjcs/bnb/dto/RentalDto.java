package com.cjcs.bnb.dto;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class RentalDto {
    
    //주문항목공통 필드
    private int o_id;                 // 주문번호
    private String o_c_id;            // 대여자아이디
    private Timestamp o_date;         // 주문일시
    private String o_delivery_sort;   // 배송방법(택배or방문수령)
    private String o_recip_addr;      // 배송지주소
    private String o_recip_name;      // 수령인
    private String o_recip_phone;     // 수령인연락처

    //대여항목만 가지는 필드
    private String r_s_id;            // 판매자아이디
    private String r_b_isbn;          // 책ISBN
    private String r_c_id;            // 대여자아이디(공통필드랑 값은 중복이지만 아무튼 필요함)

    private int r_order_status_id;          // 주문상태코드(숫자1자리)
    private String r_ordercancel_rejection_reason;   // 주문취소불가사유

    private int r_delivery_status_id;       // 배송상태코드(숫자1자리)
    private Timestamp r_deliverydate;       // 배송완료일
    private int r_rentalperiod;             // 대여기간(7or14)
    private Timestamp r_duedate;            // 반납기한일

    private int r_rental_status_id;         // 대여상태코드(숫자1자리)
    private Timestamp r_returndate;         // 반납일자
    private int r_latefee_total;            // 연체료총액
    private String r_latefee_paid;          // 연체료납부여부(YorN)
    private Timestamp r_latefee_paydate;    // 연체료납부일


}
