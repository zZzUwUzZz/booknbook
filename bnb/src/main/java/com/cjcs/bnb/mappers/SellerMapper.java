package com.cjcs.bnb.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;

@Mapper
public interface SellerMapper {

    List<SellerDto> searchBookstores(@Param("keyword") String keyword,
            @Param("startIdx") int startIdx,
            @Param("limit") int limit);

    int countBookstores(@Param("keyword") String keyword);

    @Select("SELECT * FROM seller_file WHERE sf_s_id = #{s_id}")
    List<SellerFileDto> getImagesBySellerId(String s_id);

    List<SellerDto> getAllBookstores();

    SellerDto getSellerById(String sellerId);

    SellerFileDto getSellerFile(String sellerId);
}
