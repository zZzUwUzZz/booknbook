package com.cjcs.bnb.dto;

import java.util.List;
import com.cjcs.bnb.dao.OrderItemDto;
import lombok.Data;

@Data
public class OrderDto {
    
    // 주문 정보 필드
    private String orderId;
    private List<OrderItemDto> orderItems;
    private double totalAmount;

    // 결제 정보 필드
    private PaymentDto payment;

    // 배송 정보 필드
    private ShoppingAddressDto sAddress;
}

