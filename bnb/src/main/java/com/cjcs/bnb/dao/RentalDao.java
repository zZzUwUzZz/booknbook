package com.cjcs.bnb.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.RentalDto;
import com.cjcs.bnb.dto.RentalReservationDto;
import com.cjcs.bnb.service.RentalService;

@Mapper

public interface RentalDao {

    //수희    
    public List<HashMap<String, String>> getRentalListByOId(Integer o_id);
    public List<HashMap<String, String>> getRentalListByCId(String c_id);
    public List<HashMap<String, String>> getCurrentRentalListByCId(String c_id);
    public List<RentalDto> getLatest5RentalListByCId(String c_id);

    public int countCurrentRentalByCId(String c_id);
    public int countLateReturnByCId(String c_id);

    public boolean cancelRentalByOId(Integer o_id);

    public List<RentalReservationDto> getReservationListByCId(String c_id);
    public void updateReservationByRRId(int rr_id);

    //예림
    public List<RentalDto> RentResList(String s_id); // 예약 신청 리스트 불러오기
    public void ReserveAccept(@Param("rr_id") int rr_id); // 예약 수락
    public void ReserveRefuse(@Param("rr_id") int rr_id, @Param("rr_rejection_reason") String rr_rejection_reason); // 예약 거절
    public List<RentalDto> RentCurrentList(String s_id); // 대여현황
    public List<RentalDto> RentReturnList(String s_id); // 반납현황
    public List<RentalDto> getRentalList();             // 대여 항목 가져오기
    public RentalDto getLateFeeInfo(int r_id);   

    //유다
    public int getLateFee(ArrayList<Integer> r_idList);
    // public List<RentalDto> getAllLateRentals() {
    //     // 데이터베이스에서 모든 연체 대여 항목
    // }
}
