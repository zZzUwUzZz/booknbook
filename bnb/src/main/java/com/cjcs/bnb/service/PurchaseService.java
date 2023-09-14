package com.cjcs.bnb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjcs.bnb.dao.PurchaseDao;
import com.cjcs.bnb.dto.RefExchDto;

import lombok.extern.slf4j.Slf4j;


// 이 서비스클래스 안에서는 아래 관련작업 하시면 됨요.

// 카트-결제-주문 흐름에서 구매부분
// 판매자 : 셀러페이지에서 구매/교환반품 관련 작업
// 구매자 : 마이페이지에서 구매/교환반품 관련 작업
// (아무튼 구매/교환반품 관련된 건 전부)


@Slf4j
@Service
public class PurchaseService {
    
    @Autowired
    private PurchaseDao pDao;
    

    //수희
    @Transactional
    public void requestRefExch(String re_sort, ArrayList<Integer> p_idList, ArrayList<Integer> re_amountList, String re_reason) {

        int listLength = p_idList.size();

        for (int n=0; n<listLength; n++) {

            int p_id = p_idList.get(n);
            int re_amount = re_amountList.get(n);

            RefExchDto reDto = pDao.getPurchaseInfoForRE(p_id);
            reDto.setRe_sort(re_sort);
            reDto.setRe_reason(re_reason);
            reDto.setRe_amount(re_amount);
            log.info("reDto:{}", reDto);

            pDao.addRefExchList(reDto);
            
        }

    }
    
}
