package com.cjcs.bnb.mappers;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;

@Mapper
public interface RandomSellerMapper {
    SellerDto getRandomSeller();

    SellerFileDto getSellerFileBySellerId(String s_id);
}