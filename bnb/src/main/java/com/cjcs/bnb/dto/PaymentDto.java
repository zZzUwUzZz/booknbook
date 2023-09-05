package com.cjcs.bnb.dto;

import lombok.Data;

@Data
public class PaymentDto {
    private String paymentMethod; // 결제 방법 (신용카드, 계좌이체, ...)
    private String cardNumber; // 카드 번호 (신용카드 결제 시)
    // 기타 결제 정보 필드
}