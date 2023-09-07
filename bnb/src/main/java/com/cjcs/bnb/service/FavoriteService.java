package com.cjcs.bnb.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.mappers.FavoriteMapper;

@Service
public class FavoriteService {

    @Autowired
    private FavoriteMapper favoriteMapper;
    public Boolean isFavorite(String userId, String storeId) {
        System.out.println("isFavorite called with userId: " + userId + ", storeId: " + storeId); // 로그 추가
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("storeId", storeId);
    
        Integer count = favoriteMapper.isFavorite(params);
        System.out.println("Count from database: " + count); // 로그 추가
        return (count != null && count > 0);
    }


    public boolean toggleFavorite(String userId, String storeId) {
        Boolean isFavorite = isFavorite(userId, storeId);  // 이제 Boolean 타입을 반환
    
        if (isFavorite == null) {
            // 에러 처리 또는 로깅
            return false;
        }
    
        if (isFavorite) {
            favoriteMapper.deleteFavorite(userId, storeId);
            return false;
        } else {
            favoriteMapper.insertFavorite(userId, storeId);
            return true;
        }
    }
    
}