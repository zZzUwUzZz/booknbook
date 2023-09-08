package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
    public List<RentalDto> RentResList(String s_id); // 예약신청리스트
    public List<RentalDto> ResStatusList(); // 예약상태
    
    public List<RentalDto> RentReturnList(String s_id); // 반납현황
    
    

}
