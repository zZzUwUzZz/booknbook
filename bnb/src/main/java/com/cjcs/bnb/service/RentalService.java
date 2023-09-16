package com.cjcs.bnb.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjcs.bnb.dao.RentalDao;
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


    // 수희

    // 연체료 업데이트
    public void updateLatefee() {

        try {

            // 연체자들(연체료납부여부=N) 불러오기
            List<RentalDto> rList = rDao.getRentalListByLatefeePaid("N");

            if (rList != null) {

                // 아직도 반납 안 했으면 연체료 업데이트
                for (RentalDto rDto : rList) {

                    if (rDto.getR_rental_status_id() == 3) {
                        Integer r_id = rDto.getR_id();
                        Integer latefee = rDao.getStoreLatefeeByRId(r_id);
                        rDao.updateLatefeeByRId(r_id, latefee);
                    }
                }
            }
            
        } catch (Exception e) {
            System.out.println("ERROR: "+e.getStackTrace());
        }

    }

    // 신규연체발생 처리
    public void checkReturn() {

        try {

            // 대여자들(상태코드=2) 불러오기 
            List<RentalDto> rList = rDao.getRentalListByStatusR(2);
            log.info("rList:{}", rList);

            if (rList != null) {
                LocalDate currDate = LocalDate.now();

                // 반납기한 지났으면 대여상태,연체료,연체료납부여부 업데이트
                for (RentalDto rDto : rList) {

                    LocalDate dueDate = ((Timestamp)rDto.getR_duedate()).toLocalDateTime().toLocalDate();

                    if (currDate.isAfter(dueDate)) {
                        Integer r_id = rDto.getR_id();
                        Integer latefee = rDao.getStoreLatefeeByRId(r_id);
                        rDao.updateRentalStatusByRId(r_id, 3, latefee, "N");
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR: "+e.getStackTrace());
        }

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

    public List<RentalReservationDto> getReservationListByDateRange(String c_id, LocalDate startDate,
            LocalDate endDate) {
        return null;
    }

}
