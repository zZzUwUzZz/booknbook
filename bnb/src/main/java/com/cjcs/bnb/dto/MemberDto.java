package com.cjcs.bnb.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDto {

    //회원공통 필드
	private String m_id;       // request객체파라미터명==필드명(==컬럼명) 이면 스프링이 알아서 객체생성해서 필드에다 파라미터값 넣어줌..
	private String m_pw;       // 우리는 지금 DTO와 Entity를 합쳐서 DTO만으로 하려고하므로 (==컬럼명) 까지 지켜주자..
	private String m_addr;
	private String m_phone;
	private String m_email;
	private Timestamp m_joindate;  // 가입일자
    private String currentPassword;
    private String newPassword;
	
	

    // 일반회원만 가지는 필드
    private String c_name; // 회원이름

    // 서점회원만 가지는 필드

    private String sf_sysname;
    private String s_storename; // 서점명
    private String s_id; //서점 아이디
    private String s_storedesc; // 서점소개
    private String s_crn; // 사업자등록번호 10자리(문자열)
    private int s_deliveryfee; // 이 서점의 배송료
    private int s_latefee; // 이 서점의 1일당 연체료

    //예림
    private String o_c_id;
    private int sell_amount;
    private int rental_amount;
    private int late_amount;
}