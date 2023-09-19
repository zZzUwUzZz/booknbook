package com.cjcs.bnb.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SellerFileDto;

@Mapper
public interface FavoriteMapper {
    // Check if a store is favorited by a user
    Integer isFavorite(@Param("userId") String userId, @Param("storeId") String storeId);

    void addFavorite(@Param("userId") String userId, @Param("storeId") String storeId);

    void removeFavorite(@Param("userId") String userId, @Param("storeId") String storeId);

    void toggleFavorite(@Param("userId") String userId, @Param("storeId") String storeId, @Param("state") int state);

    // 마이페이지 즐겨찾기 서점 이미지
    List<SellerFileDto> getSellerFileListByJoinedIds(Map<String, Object> params);

}