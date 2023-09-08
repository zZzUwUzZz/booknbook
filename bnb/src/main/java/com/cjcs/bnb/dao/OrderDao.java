package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cjcs.bnb.dto.OrderDto;
import com.cjcs.bnb.dto.ShoppingAddressDto;

@Repository
public class OrderDao {
    // 주문 정보를 데이터베이스에 추가하는 메서드
    public boolean insertOrder(OrderDto oDto) {
		return false;
        // 데이터베이스에 주문 정보를 추가하는 로직
        // 추가 성공 또는 실패 여부를 반환
    }

    // 배송지 정보를 업데이트하는 메서드
    public boolean updateShoppingAddress(ShoppingAddressDto SADto) {
		return false;
        // 데이터베이스에 배송지 정보를 업데이트하는 로직
        // 업데이트 성공 또는 실패 여부를 반환
    }
}
// @Mapper
// public interface OrderDao {
//     /* 주문 취소 */
// 	public int orderCancle(String orderId);
	
// 	/* 주문 상품 정보(주문취소) */
// 	public List<OrderItemDto> getOrderItemInfo(String orderId);
	
// 	/* 주문 정보(주문취소) */
// 	public OrderDto getOrder(String orderId);
// }
