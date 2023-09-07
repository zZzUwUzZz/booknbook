package com.cjcs.bnb.mappers;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FavoriteMapper {
    Integer isFavorite(Map<String, Object> params);

    void insertFavorite(@Param("userId") String userId, @Param("storeId") String storeId);

    void deleteFavorite(@Param("userId") String userId, @Param("storeId") String storeId);
}