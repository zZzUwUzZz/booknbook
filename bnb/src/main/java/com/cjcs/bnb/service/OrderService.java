package com.cjcs.bnb.service;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dao.PurchaseDao;
import com.cjcs.bnb.dao.RentalDao;

import lombok.extern.slf4j.Slf4j;


// 이 서비스클래스 안에서는 아래 관련작업 하시면 됨요.

// 구매와 대여로 분리할 수 없고 주문단위로 처리하는 작업
// 구매와 대여가 동시에 처리되어야 하는 작업(트랜잭션 등)


@Slf4j
@Service
public class OrderService {
 
    @Autowired
    private PurchaseDao pDao;
    @Autowired
    private RentalDao rDao;
    @Autowired
    private OrderDao oDao;


    //수희
    @Transactional
    public void cancelOrderByOId(Integer o_id) {

        pDao.cancelPurchaseByOId(o_id);
        rDao.cancelRentalByOId(o_id);
    }

    //예림
    public int getTodaySellCnt(String s_id){
        return oDao.getTodaySellCnt(s_id);
    }

    public int getTodayRentCnt(String s_id){
        return oDao.getTodayRentCnt(s_id);
    }

    public int getTodayRentResCnt(String rr_s_id){
        return oDao.getTodayRentResCnt(rr_s_id);
    }

    public int getTodayDeliveryPrepare(String s_id){
        return oDao.getTodayDeliveryPrepare(s_id);
    }

    public int getTodayDeliverShip(String s_id){
        return oDao.getTodayDeliverShip(s_id);
    }

    public int getTodayDeliverComplete(String s_id){
        return oDao.getTodayDeliverComplete(s_id);
    }

    public int getMonthCancelRequest(String s_id){
        return oDao.getMonthCancelRequest(s_id);
    }

    public int getMonthReturnRequest(String s_id){
        return oDao.getMonthReturnRequest(s_id);
    }

    
}
