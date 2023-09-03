package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDao {
    
    //유다



    //수희
    public List<HashMap<String, String>> getOrderListGroupByOId(String c_id);

}
