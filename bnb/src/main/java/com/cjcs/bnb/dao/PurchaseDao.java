package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.PurchaseDto;
import com.cjcs.bnb.dto.RefExchDto;

@Mapper
public interface PurchaseDao {
    
    

    //수희
    public List<HashMap<String, String>> getPurchaseListByOId(Integer o_id);
    public List<HashMap<String, String>> getPurchaseListByCId(String c_id);
    public HashMap<String, String> getPurchaseItemByPId(Integer p_id);
    public List<PurchaseDto> getLatest5PurchaseListByCId(String c_id);

    public RefExchDto getPurchaseInfoForRE(Integer p_id);  // o_id, c_id, s_id, b_isbn만 가져와서 RefExchDto에 넣어 반환
    public Boolean addRefExchList(RefExchDto reDto);
    public List<RefExchDto> getRefExchListByCId(String c_id);
    public List<RefExchDto> getCurrentRefExchListByCId(String c_id);
    public int countCurrentRefExchByCId(String c_id);

    public boolean cancelPurchaseByOId(Integer o_id);

}
