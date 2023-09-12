package com.cjcs.bnb.service;

import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.transaction.annotation.Transactional;

import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dao.PurchaseDao;
import com.cjcs.bnb.dao.RentalDao;
import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.CartDto;
import com.cjcs.bnb.dto.PurchaseDto;
import com.cjcs.bnb.dto.RentalDto;

// 이 서비스클래스 안에서는 아래 관련작업 하시면 됨요.

// 구매와 대여로 분리할 수 없고 주문단위로 처리하는 작업
// 구매와 대여가 동시에 처리되어야 하는 작업(트랜잭션 등)

@Service
public class OrderService {

    @Autowired
    private PurchaseDao pDao;
    @Autowired
    private RentalDao rDao;
    @Autowired
    private OrderDao oDao;

    // 킹효진
    public void addToCart(CartDto cartDto) {
    oDao.addToCart(cartDto);
  
}





    // 수희
    @Transactional
    public void cancelOrderByOId(Integer o_id) {

        pDao.cancelPurchaseByOId(o_id);
        rDao.cancelRentalByOId(o_id);
    }

    // 예림
    //오늘 판매 건수 카운트
    public int getTodaySellCnt(String s_id) {
        return oDao.getTodaySellCnt(s_id);
    }

    //오늘 대여 건수 카운트
    public int getTodayRentCnt(String s_id) {
        return oDao.getTodayRentCnt(s_id);
    }

    //오늘 예약 건수 카운트
    public int getTodayRentResCnt(String rr_s_id) {
        return oDao.getTodayRentResCnt(rr_s_id);
    }

    //오늘 배송 준비중 건수 카운트
    public int getTodayDeliveryPrepare(String s_id) {
        return oDao.getTodayDeliveryPrepare(s_id);
    }

    //오늘 배송중 건수 카운트
    public int getTodayDeliverShip(String s_id) {
        return oDao.getTodayDeliverShip(s_id);
    }

    //오늘 배송 준비완료 건수 카운트
    public int getTodayDeliverComplete(String s_id) {
        return oDao.getTodayDeliverComplete(s_id);
    }

    //한 달 간 취소 요청 수 카운트
    public int getMonthCancelRequest(String s_id) {
        return oDao.getMonthCancelRequest(s_id);
    }

    //한 달 간 반품/교환 요청 수 카운트
    public int getMonthReturnRequest(String s_id) {
        return oDao.getMonthReturnRequest(s_id);
    }

    //입력한 기간 내 총 정산 금액 합산
    public int getCalculate(String Start_Date, String End_Date) {
        List<Integer> RentList = oDao.CalculateRent(Start_Date, End_Date);
        List<Integer> LateList = oDao.CalculateLate(Start_Date, End_Date);
        List<Integer> SellList = oDao.CalculateSell(Start_Date, End_Date);
        List<Integer> ReturnList = oDao.CalculateReturn(Start_Date, End_Date);

        int total = 0;

        // 대여료 합계 계산
        for (Integer Rent : RentList) {
            if (Rent != null) { // null 체크 추가
                total += Rent;
            }
        }

        // 연체료 합계 계산
        for (Integer Late : LateList) {
            if (Late != null) { // null 체크 추가
                total += Late;
            }
        }

        // 판매 금액 합계 계산
        for (Integer Sell : SellList) {
            if (Sell != null) { // null 체크 추가
                total += Sell;
            }
        }

        // 반품 금액 합계 계산
        for (Integer Return : ReturnList) {
            if (Return != null) { // null 체크 추가
                total -= Return;
            }
        }

        return total;
    }

    //입력한 기간 내 대여료 합계
    public int getCalculateRent(String Start_Date, String End_Date) {
        List<Integer> RentList = oDao.CalculateRent(Start_Date, End_Date);

        int total = 0;

        // 대여료 합계 계산
        for (Integer Rent : RentList) {
            if (Rent != null) { // null 체크 추가
                total += Rent;
            }
        }

        return total;
    }

    //입력한 기간 내 연체료 합계
    public int getCalculateLate(String Start_Date, String End_Date) {
        List<Integer> LateList = oDao.CalculateLate(Start_Date, End_Date);

        int total = 0;

        // 연체료 합계 계산
        for (Integer Late : LateList) {
            if (Late != null) { // null 체크 추가
                total += Late;
            }
        }

        return total;
    }

    //입력한 기간 내 판매금액 합계
    public int getCalculateSell(String Start_Date, String End_Date) {
        List<Integer> SellList = oDao.CalculateSell(Start_Date, End_Date);

        int total = 0;

        // 판매 금액 합계 계산
        for (Integer Sell : SellList) {
            if (Sell != null) { // null 체크 추가
                total += Sell;
            }
        }

        return total;
    }

    //입력한 기간 내 반품/환불 합계
    public int getCalculateReturn(String Start_Date, String End_Date) {
        List<Integer> ReturnList = oDao.CalculateReturn(Start_Date, End_Date);

        int total = 0;
    
        // 반품 금액 합계 계산
        for (Integer Return : ReturnList) {
            if (Return != null) { // null 체크 추가
                total -= Return;
            }
        }

        return total;
    }

    
}
