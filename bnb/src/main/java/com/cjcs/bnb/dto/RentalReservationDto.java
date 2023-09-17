package com.cjcs.bnb.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RentalReservationDto {
    
    //테이블에 있는 필드
    private int rr_id;                // 대여예약번호
    private String rr_c_id;           // 구매자아이디
    private String rr_s_id;           // 판매자아이디
    private String rr_b_isbn;         // 책ISBN
    private Timestamp rr_reqdate;         // 신청일시
    private int rr_res_status_id;         // 예약상태코드(숫자1자리)
    private String rr_rejection_reason;   // 예약불가사유
    
    private Timestamp rr_duedate;     // 결제기한
    private String rr_cancel_reason;  // 예약취소사유(기한내 미결제)

    //뷰에만 있는 필드
    private String res_status;        // 예약상태(승인대기/예약불가/예약중/예약취소/대여가능/대여완료) 
    private String s_storename;       // 예약한서점명
    private int s_deliveryfee;        // 예약한서점의배송비
    private String b_title;           // 예약한책제목
    private int b_rent;               // 예약한책대여료(7일기준)

}
