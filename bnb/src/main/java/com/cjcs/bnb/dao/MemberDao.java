package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.cjcs.bnb.dto.SellerDto;

@Mapper
public interface MemberDao {

    List<SellerDto> searchBookstores(@Param("keyword") String keyword);

    int countBookstores(@Param("keyword") String keyword);

}
