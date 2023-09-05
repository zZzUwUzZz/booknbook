package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.OrderDto;

@Mapper
public interface OrderDao {
    /* 주문 취소 */
	public int orderCancle(String orderId);
	
	/* 주문 상품 정보(주문취소) */
	public List<OrderItemDto> getOrderItemInfo(String orderId);
	
	/* 주문 정보(주문취소) */
	public OrderDto getOrder(String orderId);
 
}
