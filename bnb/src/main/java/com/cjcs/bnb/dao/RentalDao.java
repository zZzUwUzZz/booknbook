package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.RentalReservationDto;

@Mapper
public interface RentalDao {
    


    //수희    
    public List<HashMap<String, String>> getRentalListByOId(int o_id);
    public List<HashMap<String, String>> getRentalListByCId(String c_id);

    public List<RentalReservationDto> getReservationListByCId(String c_id);
    public void updateReservationByRRId(int rr_id);
    
}
