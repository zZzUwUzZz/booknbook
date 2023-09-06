package com.cjcs.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.mappers.FavoriteMapper;

@Service
public class FavoriteService {

    @Autowired
    private FavoriteMapper favoriteMapper;

    public boolean isFavorite(String userId, String storeId) {
        return favoriteMapper.isFavorite(userId, storeId);
    }

    public boolean toggleFavorite(String userId, String storeId) {
        if(isFavorite(userId, storeId)) {
            favoriteMapper.deleteFavorite(userId, storeId);
            return false;
        } else {
            favoriteMapper.insertFavorite(userId, storeId);
            return true;
        }
    }
}
