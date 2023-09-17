package com.cjcs.bnb.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjcs.bnb.dao.RentalDao;
import com.cjcs.bnb.dto.CartDto;
import com.cjcs.bnb.dto.RentalDto;
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

    @Autowired
    private SqlSession sqlSession;

    // 수희
    public List<RentalReservationDto> getReservationListByCId(String c_id) {

        return rDao.getReservationListByCId(c_id);
    }

    public void cancelReservationByRRId(int rr_id) {

        rDao.updateReservationByRRId(rr_id);
    }

    // 예림

    // 예약 신청 리스트 불러오기
    public List<RentalDto> RentResList(String s_id) {

        // 날짜 형식 포맷 변경
        List<RentalDto> resultList = rDao.RentResList(s_id);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (RentalDto dto : resultList) {
            Date reqDate = dto.getRr_reqdate();
            if (reqDate != null) {
                dto.setRr_reqdateStr(sdf.format(reqDate));
            }
        }
        return resultList;
    }

    // 예약 상태 수락
    public void ReserveAccept(RentalDto requestData) {
        rDao.ReserveAccept(requestData.getRr_id());
    }

    // 예약 상태 거절
    public void ReserveRefuse(RentalDto requestData) {
        rDao.ReserveRefuse(requestData.getRr_id(), requestData.getRr_rejection_reason());
    }

    // 대여 현황 리스트
    public List<RentalDto> RentCurrentList(String s_id) {
        // 날짜 형식 포맷 변경
        List<RentalDto> resultList = rDao.RentCurrentList(s_id);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (RentalDto dto : resultList) {
            Date o_date = dto.getO_date();
            Date returnexpect_days = dto.getReturnexpect_days();
            if (o_date != null) {
                dto.setO_dateStr(sdf.format(o_date));
            }
            if(returnexpect_days!=null){
                dto.setReturnexpect_daysStr(sdf.format(returnexpect_days));
            }
        }

        return resultList;
    }

    // 반납 현황 리스트
    public List<RentalDto> RentReturnList(String s_id) {

        // 날짜 형식 포맷 변경
        List<RentalDto> resultList = rDao.RentReturnList(s_id);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (RentalDto dto : resultList) {
            Date o_date = dto.getO_date();
            if (o_date != null) {
                dto.setO_dateStr(sdf.format(o_date));
            }
        }
        return resultList;
    }
    public Map<String, Object> getLateFeeInfo(ArrayList<Integer> r_idList) {
        int lateFee = rDao.getLateFee(r_idList);  // 연체료를 가져오는 DAO 메서드
        
        Map<String, Object> response = new HashMap<>();
        response.put("lateFee", lateFee);
        response.put("r_idList", r_idList);
        
        return response;
    }
    // public List<RentalDto> getAllLateRentals() {
    //     // 연체된 대여 항목의 목록
    //     return rDao.getAllLateRentals();
    // }
}