package com.cjcs.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.mappers.FavoriteMapper;

@Service
public class FavoriteService {

    @Autowired
    private FavoriteMapper favoriteMapper;

    // 문자열 "true" 또는 "false"를 반환
    public String isFavorite(String userId, String storeId) {
        String result = favoriteMapper.isFavorite(userId, storeId);
        System.out.println("Is Favorite: " + result); // 로그 추가
        return result;
    }

    public boolean toggleFavorite(String userId, String storeId) {
        String isFavoriteStr = isFavorite(userId, storeId);
        boolean isFavorite = "true".equals(isFavoriteStr);

        if (isFavorite) {
            favoriteMapper.deleteFavorite(userId, storeId);
            return false;
        } else {
            favoriteMapper.insertFavorite(userId, storeId);
            return true;
        }
    }
}