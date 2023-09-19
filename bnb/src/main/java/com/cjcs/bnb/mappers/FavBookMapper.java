package com.cjcs.bnb.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.FavBookDTO;

@Mapper
public interface FavBookMapper {

    public Integer getFavState(FavBookDTO favBookDTO);

    void addFav(FavBookDTO favBookDTO); // 찜하기 추가

    void removeFav(FavBookDTO favBookDTO); // 찜하기 제거

    String getFavBookStoreName(@Param("c_id") String c_id, @Param("favb_b_isbn") String favb_b_isbn);

}
