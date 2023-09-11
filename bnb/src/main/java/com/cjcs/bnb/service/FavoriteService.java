package com.cjcs.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.mappers.FavoriteMapper;

@Service
public class FavoriteService {
    @Autowired
    private FavoriteMapper favoriteMapper;

    public boolean isFavorite(String userId, String storeId) {
        Integer result = favoriteMapper.isFavorite(userId, storeId);
        return result != null && result > 0;
    }

    public boolean addFavorite(String userId, String storeId) {
        favoriteMapper.addFavorite(userId, storeId);
        return true;
    }

    public boolean removeFavorite(String userId, String storeId) {
        favoriteMapper.removeFavorite(userId, storeId);
        return true;
    }

    public void toggleFavorite(String userId, String storeId, int state) {
        favoriteMapper.toggleFavorite(userId, storeId, state);
    }
}
