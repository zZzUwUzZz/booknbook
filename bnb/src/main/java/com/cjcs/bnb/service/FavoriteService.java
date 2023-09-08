package com.cjcs.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.mappers.FavoriteMapper;

@Service
public class FavoriteService {
   @Autowired
    private FavoriteMapper favoriteMapper;

    // public int isFavorite(String userId, String storeId) {
    //     return favoriteMapper.isFavorite(userId, storeId);
    // }

    // public boolean toggleFavorite(String userId, String storeId) {
    //     System.out.println("Service: toggleFavorite called with userId: " + userId + ", storeId: " + storeId);
    //     int isFavorite = isFavorite(userId, storeId); // int로 받음
    //     if (isFavorite == 1) { // 1과 비교
    //         favoriteMapper.removeFavorite(userId, storeId);
    //         return false;
    //     } else {
    //         favoriteMapper.addFavorite(userId, storeId);
    //         return true;
    //     }
    // }
    

    public boolean addFavorite(String userId, String storeId) {
        favoriteMapper.addFavorite(userId, storeId);
        return true;
    }

    public boolean removeFavorite(String userId, String storeId) {
        favoriteMapper.removeFavorite(userId, storeId);
        return true;
    }

}
