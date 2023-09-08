package com.cjcs.bnb.dto;

import lombok.Data;


// 검색을 위한 DTO

@Data
public class SearchDto {
    
	private String colname;   // 예: 검색범위가 제목인지 내용인지..
	private String keyword;   // 검색어
	private int pageNum = 1;      // 보여줄 페이지의 번호
	private int pageCnt = 5;      // 페이지 당 출력할 페이지번호의 개수
	private int listCnt = 10;      // 페이지 당 출력할 글의 개수
	private String listUrl;   // 페이징처리 하려는 뷰페이지의 url공통부분

}
