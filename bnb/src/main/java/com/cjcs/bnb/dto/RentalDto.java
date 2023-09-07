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

    //뷰에만 있는 필드
    private int b_rent;                // 대여료(7일기준)
    private String s_storename;        // 서점명
    private String b_title;            // 도서명
    private String order_status;       // 주문상태(주문완료/취소요청/취소불가/취소완료)
    private String delivery_status;    // 배송상태(결제완료/상품준비중/상품준비완료/수령완료/배송준비중/배송중/배송완료)
    private String rental_status;      // 대여상태(대여중/연체/반납완료)

    //
    private int rr_id;                 // 대여 예약번호
    private String rr_c_id;            // 대여자 아이디
    private Timestamp rr_reqdate;      // 예약 신청일자
    private String rr_reqdateStr;      // 예약 신청일자 (날짜 데이터 형식 변환)
    private String res_status;         // 예약 상태
    private String new_res_status;     // 예약 상태 (DB 업데이트용)
    private int overdue_days;          // 연체일
    
    private String o_dateStr;         // 주문일시 (날짜 데이터 형식 변환)

}
