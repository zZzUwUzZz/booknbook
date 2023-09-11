package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.RentalDto;
import com.cjcs.bnb.dto.RentalReservationDto;

@Mapper
public interface RentalDao {
    

    

    //수희    
    public List<HashMap<String, String>> getRentalListByOId(Integer o_id);
    public List<HashMap<String, String>> getRentalListByCId(String c_id);
    public List<HashMap<String, String>> getCurrentRentalListByCId(String c_id);
    public List<RentalDto> getLatest5RentalListByCId(String c_id);

    public int countCurrentRentalByCId(String c_id);

    public boolean cancelRentalByOId(Integer o_id);

    public List<RentalReservationDto> getReservationListByCId(String c_id);
    public void updateReservationByRRId(int rr_id);

    //예림
    public List<RentalDto> RentResList(String s_id); // 예약 신청 리스트 불러오기
    public void ReserveAccept(@Param("rr_id") int rr_id); // 예약 수락
    public void ReserveRefuse(@Param("rr_id") int rr_id, @Param("rr_rejection_reason") String rr_rejection_reason); // 예약 거절
    public List<RentalDto> RentCurrentList(String s_id); // 대여현황
    public List<RentalDto> RentReturnList(String s_id); // 반납현황
    
    

}
