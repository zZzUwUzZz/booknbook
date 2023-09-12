package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.cjcs.bnb.dto.CartDto;

@Mapper
public interface OrderDao {
    
    //유다,수희
    public List<CartDto> getCartByCId(String c_id);
    public List<CartDto> getPurchaseCartByCId(String c_id);
    public List<CartDto> getRentalCartByCId(String c_id);
    public int deleteCartItem(int cart_id);
    public int updateCartAmount(int cart_id, int cart_amount);
    public int updateCartRentalPeriod(int cart_id, int cart_rentalperiod);

    //수희
    public List<HashMap<String, String>> getOrderListGroupByOId(String c_id);
    public HashMap<String, String> getOrderInfoByOId(int o_id);

    //예림
    public int getTodaySellCnt(String s_id);
    public int getTodayRentCnt(String s_id);
    public int getTodayRentResCnt(String rr_s_id);
    public int getTodayDeliveryPrepare(String s_id);
    public int getTodayDeliverShip(String s_id);
    public int getTodayDeliverComplete(String s_id);
    public int getMonthCancelRequest(String s_id);
    public int getMonthReturnRequest(String s_id);
    public List<Integer> CalculateRent(String Start_Date, String End_Date);
    public List<Integer> CalculateLate(String Start_Date, String End_Date);
    public List<Integer> CalculateSell(String Start_Date, String End_Date);
    public List<Integer> CalculateReturn(String Start_Date, String End_Date);
    
}
