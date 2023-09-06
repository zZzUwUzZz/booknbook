package com.cjcs.bnb.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FavoriteMapper {
    String isFavorite(@Param("userId") String userId, @Param("storeId") String storeId); // boolean -> String

    void insertFavorite(@Param("userId") String userId, @Param("storeId") String storeId);

    void deleteFavorite(@Param("userId") String userId, @Param("storeId") String storeId);
}