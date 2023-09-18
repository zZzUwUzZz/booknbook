package com.cjcs.bnb.mappers;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;

@Mapper
public interface SellerMapper {
    SellerDto getSellerById(String sellerId);

    SellerFileDto getSellerFile(String sellerId);
}
