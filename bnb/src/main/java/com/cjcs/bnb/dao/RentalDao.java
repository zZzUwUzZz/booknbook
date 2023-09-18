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
    public void ReserveAccept(@Param("rr_id") int rr_id); // 예약 수락
    public void ReserveRefuse(@Param("rr_id") int rr_id, @Param("rr_rejection_reason") String rr_rejection_reason); // 예약 거절
    public List<RentalDto> RentCurrentList(String s_id); // 대여현황
    public List<RentalDto> RentReturnList(String s_id); // 반납현황
    
    

}
