package com.cjcs.bnb.mappers;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FavoriteMapper {
    // Check if a store is favorited by a user
    Integer isFavorite(@Param("userId") String userId, @Param("storeId") String storeId);

    void addFavorite(@Param("userId") String userId, @Param("storeId") String storeId);

    void removeFavorite(@Param("userId") String userId, @Param("storeId") String storeId);

    void toggleFavorite(@Param("userId") String userId, @Param("storeId") String storeId, @Param("state") int state);
}