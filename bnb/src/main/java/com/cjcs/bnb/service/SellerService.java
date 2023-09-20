package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;
import com.cjcs.bnb.mappers.SellerMapper;

@Service
public class SellerService {
    @Autowired
    private SellerMapper sMp;

    public SellerDto getSellerById(String sellerId) {
        return sMp.getSellerById(sellerId);
    }

    public SellerFileDto getSellerFile(String sellerId) {
        return sMp.getSellerFile(sellerId);
    }

}