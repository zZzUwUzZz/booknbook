package com.cjcs.bnb.dto;

import lombok.Data;

@Data
public class OrderItemDto {
    private String productId;
    private String productName;
    private int quantity;
    private double price;
}
