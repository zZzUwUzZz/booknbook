package com.cjcs.bnb.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dao.NotificationDao;
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
    @Autowired
    private BookMapper bookDao;
    @Autowired
    private NotificationDao nDao;
      @Autowired
     private SqlSession sqlSession;
 
 
    // 킹효진

    public String requestRental(RentalReservationDto rrDto) {
        RentalReservationDto existingRental = rDao.findRentalByCriteria(rrDto);
        if (existingRental != null) {
            return "already";
        }
        rDao.insertRental(rrDto);
        return "success";
    }
 
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

    // 대여예약건들 처리
    public void checkReservation() {

        try {

            // 대여가능 상태인 예약건들(상태코드=5) 불러오기 
            List<RentalReservationDto> rrList5 = rDao.getReservationListByStatusRR(5);
            log.info("rrList5:{}", rrList5);

            if (rrList5 != null) {

                LocalDate currDate = LocalDate.now();

                for (RentalReservationDto rrDto5 : rrList5) {

                    LocalDate dueDate = ((Timestamp)rrDto5.getRr_duedate()).toLocalDateTime().toLocalDate();

                    // 결제시한 지났으면 예약상태,취소사유 업데이트
                    if (currDate.isAfter(dueDate)) {

                        rDao.updateReservationByRRId(rrDto5.getRr_id(), 4, "기한내미결제");
                        
                        String rr_s_id = rrDto5.getRr_s_id();
                        String rr_b_isbn = rrDto5.getRr_b_isbn();

                        // 다음예약자(상태코드=3) 있는지 확인
                        RentalReservationDto rrDto3 = rDao.getFirstReservationByStatusRR(3, rr_s_id, rr_b_isbn);

                        if (rrDto3 != null) {   // 있다면 예약상태,결제시한 업데이트하고 알림창에 추가

                            rDao.setPaymentDuedate(rrDto3.getRr_id(), 2);
                            nDao.addToNotifboard(rrDto3.getRr_c_id(), "대여가능", rrDto3.getRr_b_isbn(), rrDto3.getRr_s_id(), rrDto3.getB_title(), rrDto3.getS_storename());

                        } else {                // 없다면

                            // 예약승인대기자(상태코드=1)라도 있는지 확인
                            RentalReservationDto rrDto1 = rDao.getFirstReservationByStatusRR(1, rr_s_id, rr_b_isbn);

                            if (rrDto1 != null) {   // 있다면 예약상태,결제시한 업데이트하고 알림창에 추가

                                rDao.setPaymentDuedate(rrDto1.getRr_id(), 2);
                                nDao.addToNotifboard(rrDto1.getRr_c_id(), "대여가능", rrDto1.getRr_b_isbn(), rrDto1.getRr_s_id(), rrDto1.getB_title(), rrDto1.getS_storename());

                            } else {                // 없다면 해당책의 대여재고 1로 복구

                                bookDao.updateRentalStock(rr_s_id, rr_b_isbn, -1);
                            }
                        }
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

    // 예약 신청 수락
    public void ReserveAccept(RentalDto requestData) {
        rDao.ReserveAccept(requestData.getRr_id());
    }

    // 예약 신청 거절
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
            if (returnexpect_days != null) {
                dto.setReturnexpect_daysStr(sdf.format(returnexpect_days));
            }
        }

        return resultList;
    }

    // 배송 상태명
    public List<RentalDto> DeliveryStatusList() {
        return rDao.DeliveryStatusList();
    }

    // 배송상태, 대여상태 업데이트
    @Transactional
    public void UpdateDeliStatus(List<RentalDto> requestData) {
        for (RentalDto request : requestData) {
            rDao.UpdateDeliStatus(request.getO_id(), request.getDelivery_status(), request.getB_title());
            UpdateRentStatus_Wait(request);
            UpdateRentStatus_Curr(request);
            UpdateRentStatus_Late(request);
            RentResStatus_First(request);
        }
    }

    // 대여 상태 업데이트 [대여시작전]
    public void UpdateRentStatus_Wait(RentalDto requestData) {
        rDao.UpdateRentStatus_Wait(requestData.getO_id(), requestData.getB_title());
    }

    // 대여 상태 업데이트 [대여중]
    public void UpdateRentStatus_Curr(RentalDto requestData) {
        rDao.UpdateRentStatus_Curr(requestData.getO_id(), requestData.getB_title());
    }

    // 대여 상태 업데이트 [연체]
    public void UpdateRentStatus_Late(RentalDto requestData) {
        rDao.UpdateRentStatus_Late(requestData.getO_id(), requestData.getB_title());
    }

    // 대여 상태 업데이트 [반납 완료]
    public void UpdateRentStatus_Return(RentalDto requestData) {
        rDao.UpdateRentStatus_Return(requestData.getO_id(), requestData.getB_title());
    }

    // 예약 1순위 예약 상태 변경
    public void RentResStatus_First(RentalDto requestData) {
        rDao.RentResStatus_First(requestData.getB_title());
    }

    // 대여 재고 조회
    public int getRentalStock(RentalDto requestData) {
        return rDao.getRentalStock(requestData.getB_title());
    }

    // 대여 재고 +1
    public void RentalStockAdd(RentalDto requestData, String s_id) {
        rDao.RentalStockAdd(requestData.getB_title(), s_id);
    }

    // 예약자 수 조회
    public int CountRentalRes(RentalDto requestData) {
        return rDao.CountRentalRes(requestData.getB_title());
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
