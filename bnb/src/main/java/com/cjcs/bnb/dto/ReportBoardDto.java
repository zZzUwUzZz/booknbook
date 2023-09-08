package com.cjcs.bnb.dto;

import java.sql.Timestamp;

import lombok.Data;


// 독립서점익명제보 게시판을 위한 DTO

@Data
public class ReportBoardDto {

    //테이블에 있는 필드
	private int report_id;           // 글번호
	private String report_title;     // 글제목
	private String report_content;   // 글내용
	private Timestamp report_date;   // 게시일자, String으로 해도 오라클이 알아서 문자열로 바꿔 넣어주긴 하는데.. 시분초가 출력 안 됨
	
}