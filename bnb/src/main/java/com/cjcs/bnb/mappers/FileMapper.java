package com.cjcs.bnb.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.cjcs.bnb.dto.SellerFileDto;

@Mapper
public interface FileMapper {
    @Insert("INSERT INTO Seller_File (sf_id, sf_s_id, sf_oriname, sf_sysname) VALUES (file_id_seq.NEXTVAL, #{sellerId}, #{originalFilename}, #{systemFileName})")
    void insertFileInfo(String sellerId, String originalFilename, String systemFileName);

    @Select("SELECT sf_sysname FROM Seller_File WHERE sf_s_id = #{sellerId}")
    List<String> FileNamesBySellerId(String sellerId);

     @Select("SELECT * FROM seller_file WHERE sf_s_id = #{s_id}")
    List<SellerFileDto> getImagesBySellerId(String s_id);
}