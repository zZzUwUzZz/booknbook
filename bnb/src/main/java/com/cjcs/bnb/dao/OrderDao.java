package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDao {
    
    //유다



    //수희
    public List<HashMap<String, String>> getOrderListGroupByOId(String c_id);
    public HashMap<String, String> getOrderInfoByOId(int o_id);

    //예림
    int getTodaySellCnt(String s_id);
    int getTodayRentCnt(String s_id);
    int getTodayRentResCnt(String rr_s_id);
    int getTodayDeliveryPrepare(String s_id);
    int getTodayDeliverShip(String s_id);
    int getTodayDeliverComplete(String s_id);
    int getBookmarkMemberCnt(String s_id);
    int getMonthCancelRequest(String s_id);
    int getMonthReturnRequest(String s_id);
    
}
