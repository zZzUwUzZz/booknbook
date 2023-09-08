package com.cjcs.bnb.mappers;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FavoriteMapper {
    // Check if a store is favorited by a user
    int isFavorite(@Param("userId") String userId, @Param("storeId") String storeId);
    
    // Add a store to favorites
    void addFavorite(@Param("userId") String userId, @Param("storeId") String storeId);
    
    // Remove a store from favorites
    void removeFavorite(@Param("userId") String userId, @Param("storeId") String storeId);
    
    // Toggle favorite status
    void toggleFavorite(@Param("userId") String userId, @Param("storeId") String storeId, @Param("state") int state);
}