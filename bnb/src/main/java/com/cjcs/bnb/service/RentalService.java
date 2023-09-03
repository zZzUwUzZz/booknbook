package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.RentalDao;
import com.cjcs.bnb.dto.RentalReservationDto;

import lombok.extern.slf4j.Slf4j;


// 이 서비스클래스 안에서는 아래 관련작업 하시면 됨요.

// 카트-결제-주문 흐름에서 대여부분
// 판매자 : 셀러페이지에서 대여관련 작업
// 구매자 : 마이페이지에서 대여관련 작업
// (아무튼 대여/대여예약/연체 관련된 건 전부)


@Slf4j
@Service
public class RentalService {
    
    @Autowired
    private RentalDao rDao;




    //수희
    public List<RentalReservationDto> getReservationListByCId(String c_id) {

        return rDao.getReservationListByCId(c_id);
    }

    public void cancelReservationByRRId(int rr_id) {

        rDao.updateReservationByRRId(rr_id);
    }

}
