package com.cjcs.bnb.dto;

import lombok.Data;

@Data
public class SellerFileDto {
	private int sf_id; // 파일번호
	private String sf_s_id; // 판매자아이디
	private String sf_oriname; // --a.jpg 원본파일명
	private String sf_sysname; // --329840284093.jpg 서버에 올라간 파일명
}
