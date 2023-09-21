package com.cjcs.bnb.service;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;
import com.cjcs.bnb.mappers.RandomSellerMapper;
import com.cjcs.bnb.mappers.SellerMapper;

@Service
public class SellerService {
    @Autowired
    private SellerMapper sMp;
    @Autowired
    private RandomSellerMapper randomSellerMapper;

    public Map<String, Object> getRandomSellerWithFile() {
        SellerDto seller = randomSellerMapper.getRandomSeller();
        SellerFileDto file = randomSellerMapper.getSellerFileBySellerId(seller.getS_id());

        Map<String, Object> result = new HashMap<>();
        result.put("seller", seller);
        result.put("file", file);
        return result;
    }

    public SellerDto getSellerById(String sellerId) {
        return sMp.getSellerById(sellerId);
    }

    public SellerFileDto getSellerFile(String sellerId) {
        return sMp.getSellerFile(sellerId);
    }

    public Boolean resetSellerPassword(Map<String, String> inputData) {
        int updatedRows = sMp.resetSellerPassword(inputData);
        return updatedRows > 0;
    }

}
