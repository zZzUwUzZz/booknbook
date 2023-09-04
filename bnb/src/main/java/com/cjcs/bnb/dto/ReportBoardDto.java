package com.cjcs.bnb.dto;

import lombok.Data;

@Data
public class ReportBoardDto {

    // 연습프로젝트에서 샘플 가져옴!!!!!
    
    private int b_num;
	private String b_title;
	private String m_name;
	// private Timestamp b_date;   // String으로 해도 오라클이 알아서 문자열로 바꿔 넣어주긴 하는데.. 시분초가 출력 안 됨
	private int b_views;
	// 윗부분이 게시글목록 화면에 출력될 뷰..
	//아래 필드들은 상세보기 화면 등에서 쓸 거임.. 지금 dto랑 entity를 뭉쳐서 하고 있어서 이렇게 함
	private String b_id;
	private String b_contents;
	
}