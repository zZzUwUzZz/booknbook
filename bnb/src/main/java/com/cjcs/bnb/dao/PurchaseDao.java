package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PurchaseDao {
    


    //수희
    public List<HashMap<String, String>> getPurchaseListByOId(int o_id);
    public List<HashMap<String, String>> getPurchaseListByCId(String c_id);

}
