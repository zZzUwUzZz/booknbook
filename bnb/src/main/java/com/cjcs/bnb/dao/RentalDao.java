package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.RentalDto;
import com.cjcs.bnb.dto.RentalReservationDto;
import com.cjcs.bnb.dto.SearchDto;

@Mapper
public interface RentalDao {
    

    // 킹효진
    RentalReservationDto findRentalByCriteria(RentalReservationDto rrDto);

    int insertRental(RentalReservationDto rrDto);
    
    //수희

    //대여
    public List<HashMap<String, Object>> getRentalListByOId(Integer o_id);

    public List<HashMap<String, String>> getRentalListByCId(String c_id);
    public List<HashMap<String, String>> getRentalListByDateRange(SearchDto sDto);
    public RentalDto getRentalByRId(Integer r_id);
    public List<RentalDto> getRentalListByStatusR(Integer code);
    public List<RentalDto> getRentalListByLatefeePaid(String code);
    public List<HashMap<String, String>> getCurrentRentalListByCId(String c_id);
    public List<RentalDto> getLatest5RentalListByCId(String c_id);
    public List<HashMap<String, String>> getCustomerBlackList(Integer frequency);

    public int updateRentalStatusByRId(Integer r_id, Integer code, Integer latefee, String paid_or_not);
    public int updateLatefeeByRId(Integer r_id, Integer latefee);
    public int updateLatefeePayDateByRId(Integer r_id, String code);
    public Integer getStoreLatefeeByRId(Integer r_id);

    public int countCurrentRentalByCId(String c_id);
    public int countLateReturnsByCId(String c_id);
    public int countRentalsByDateRange(SearchDto sDto);
    public HashMap<String, Object> countAllRentalItems();

    public int addRentalList(Integer o_id,  String s_id, String b_isbn, String c_id, Integer r_rentalperiod);

    public boolean cancelRentalByOId(Integer o_id);

    //대여예약
    public RentalReservationDto getReservationByRRId(Integer rr_id);
    public List<RentalReservationDto> getReservationListByCId(String c_id);
    public List<RentalReservationDto> getReservationListByStatusRR(Integer code);
    public RentalReservationDto getFirstReservationByStatusRR(Integer code, String s_id, String b_isbn);
    public List<RentalReservationDto> getReservationListByDateRange(SearchDto sDto);

    public int countReservationsByDateRange(SearchDto sDto);

    public void updateReservationByRRId(int rr_id, int code, String cancel_reason);
    public void setPaymentDuedate(int rr_id, int days);  // 결제가능기간이 2일이면 days=2

    //예림
    public List<RentalDto> RentResList(String s_id); // 예약 신청 리스트 불러오기
    public void ReserveAccept(@Param("rr_id") int rr_id); // 예약 신청 수락
    public void ReserveRefuse(@Param("rr_id") int rr_id, @Param("rr_rejection_reason") String rr_rejection_reason); // 예약 신청 거절

    public List<RentalDto> RentCurrentList(String s_id); // 대여현황
    public List<RentalDto> DeliveryStatusList(); // 배송 상태명
    public void UpdateDeliStatus(@Param("o_id") int o_id, @Param("delivery_status") String delivery_status, @Param("b_title") String b_title, String s_id); // 배송 상태 업데이트
    public void UpdateRentStatus_Wait(@Param("o_id") int o_id, @Param("b_title") String b_title, String s_id); // 대여 상태 업데이트 [대여시작전]
    public void UpdateRentStatus_Curr(@Param("o_id") int o_id, @Param("b_title") String b_title, String s_id); // 대여 상태 업데이트 [대여중]
    public void UpdateRentStatus_Late(@Param("o_id") int o_id, @Param("b_title") String b_title); // 대여 상태 업데이트 [연체]
    public void UpdateRentStatus_Return(@Param("o_id") int o_id, @Param("b_title") String b_title, String s_id); // 대여 상태 업데이트 [반납 완료]
    public void RentResStatus_First(@Param("b_title") String b_title, String s_id); // 예약 1순위 예약 상태 변경  
    public void RentRes_First_Alert(@Param("b_title") String b_title, String s_id); // 예약 1순위 대여가능 알림 전송
    public int getRentalStock(@Param("b_title") String b_title, String s_id); //대여 재고 조회
    public void RentalStockAdd(@Param("b_title") String b_title, String s_id); //대여 재고 +1
    public int CountRentalRes(@Param("b_title") String b_title, String s_id); // 예약자 수 조회
    public void RentRes_First_Pay(@Param("b_title") String b_title, String s_id); // 예약 1순위 결제기한 추가


    public List<RentalDto> RentReturnList(String s_id); // 반납현황
    
    

}
