package com.cjcs.bnb.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FavoriteMapper {
    boolean isFavorite(@Param("userId") String userId, @Param("storeId") String storeId);
    void insertFavorite(@Param("userId") String userId, @Param("storeId") String storeId);
    void deleteFavorite(@Param("userId") String userId, @Param("storeId") String storeId);
}

