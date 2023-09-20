package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.PurchaseDto;
import com.cjcs.bnb.dto.RefExchDto;
import com.cjcs.bnb.dto.SearchDto;

@Mapper
public interface PurchaseDao {
    
    

//수희

    //구매관련
    public List<HashMap<String, Object>> getPurchaseListByOId(Integer o_id);
    public List<HashMap<String, String>> getPurchaseListByCId(String c_id);
    public List<HashMap<String, Object>> getPurchaseListByDateRange(SearchDto sDto);
    public List<PurchaseDto> getPurchaseListBySId(String s_id);
    public HashMap<String, String> getPurchaseItemByPId(Integer p_id);
    public List<PurchaseDto> getLatest5PurchaseListByCId(String c_id);

    public Integer countPurchasesByDateRange(SearchDto sDto);
    public HashMap<String, Object> countAllPurchaseItems();

    public int addPurchaseList(Integer o_id,  String cart_s_id, String cart_b_isbn, String c_id, Integer cart_amount);

    public boolean cancelPurchaseByOId(Integer o_id);

    public int updateOrderStatusByPId(HashMap<String, Object> order);
    public int updateDeliveryStatusByPId(HashMap<String, Integer> order);

    //교환반품관련
    public RefExchDto getPurchaseInfoForRE(Integer p_id);  // o_id, c_id, s_id, b_isbn만 가져와서 RefExchDto에 넣어 반환
    public Boolean addRefExchList(RefExchDto reDto);
    public List<RefExchDto> getRefExchListByCId(String c_id);
    public List<RefExchDto> getRefExchListByDateRange(SearchDto sDto);
    public List<RefExchDto> getCurrentRefExchListByCId(String c_id);

    public int countRefExchsByDateRange(SearchDto sDto);
    public int countCurrentRefExchByCId(String c_id);

    public Boolean deleteRefExchList(Integer re_id);



}
