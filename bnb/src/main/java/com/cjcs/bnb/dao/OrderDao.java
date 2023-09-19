package com.cjcs.bnb.dao;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.CartDto;

import com.cjcs.bnb.dto.PurchaseDto;

import com.cjcs.bnb.dto.SearchDto;


@Mapper
public interface OrderDao {

    // 킹효진

    int addToCart(CartDto cartDto);

    int updateCartItem(CartDto cartDto);

    CartDto findPurCartItem(CartDto cartDto);

    CartDto findRentCartItem(CartDto cartDto);

    CartDto insertCartItem(CartDto cartDto);


    List<PurchaseDto> getISBNListByOId(int o_id);

    // 유다,수희

    public List<CartDto> getCartByCId(String c_id);
    public CartDto getCartByCartId(Integer cart_id);
    public List<CartDto> getPurchaseCartByCId(String c_id);
    public List<CartDto> getRentalCartByCId(String c_id);

    public int deleteCartItem(int cart_id);

    public int updateCartAmount(int cart_id, int cart_amount);
    public int updateCartRentalPeriod(int cart_id, int cart_rentalperiod);

    public int addOrderSelectKey(HashMap<String, Object> orderMap);


    // 수희

    public List<HashMap<String, String>> getOrderListGroupByOId(String c_id);
    public List<HashMap<String, String>> getOrderListByDateRange(SearchDto sDto);

    public HashMap<String, Object> getOrderInfoByOId(int o_id);

    public Integer countOrdersByDateRange(SearchDto sDto);
    public HashMap<String, Object> countAllOrders();

    public List<HashMap<String, Object>> getOrderListToCancelBySId(String s_id); // 판매자 주문취소관리페이지용

    // 예림
    public int getTodaySellCnt(String s_id);

    public int getTodayRentCnt(String s_id);

    public int getTodayRentResCnt(String s_id);

    public int getTodayDeliveryPrepare(String s_id);

    public int getTodayDeliverShip(String s_id);

    public int getTodayDeliverComplete(String s_id);

    public int getMonthCancelRequest(String s_id);

    public int getMonthReturnRequest(String s_id);

    public List<Integer> CalculateRent(String Start_Date, String End_Date, String s_id);

    public List<Integer> CalculateLate(String Start_Date, String End_Date, String s_id);

    public List<Integer> CalculateSell(String Start_Date, String End_Date, String s_id);

    public List<Integer> CalculateReturn(String Start_Date, String End_Date, String s_id);


    //재락
      // 주문 추가
//       int insertOrder(OrderDto orderDto);

//       // 주문 조회
//       OrderDto getOrderById(int o_id);
  
//       // 주문 전체 조회
//       List<OrderDto> getAllOrders();
  
//       // 주문 수정
//       int updateOrder(OrderDto orderDto);
  
//       // 주문 삭제
//       int deleteOrder(int o_id);
 }

