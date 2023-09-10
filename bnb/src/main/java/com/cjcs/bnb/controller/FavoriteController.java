package com.cjcs.bnb.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjcs.bnb.service.FavoriteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class FavoriteController {
    @Autowired
    private FavoriteService favoriteService;

    @GetMapping("/isFavorite")
    public ResponseEntity<?> isFavorite(@RequestParam String userId, @RequestParam String storeId) {
        boolean isFavorite = favoriteService.isFavorite(userId, storeId);
        return new ResponseEntity<>(Map.of("isFavorite", isFavorite), HttpStatus.OK);
    }

    @PostMapping("/addFavorite")
    public ResponseEntity<?> addFavorite(@RequestParam String userId, @RequestParam String storeId) {
        boolean isSuccess = favoriteService.addFavorite(userId, storeId);
        return new ResponseEntity<>(Map.of("isSuccess", isSuccess), HttpStatus.OK);
    }

    @PostMapping("/removeFavorite")
    public ResponseEntity<?> removeFavorite(@RequestParam String userId, @RequestParam String storeId) {
        boolean isSuccess = favoriteService.removeFavorite(userId, storeId);
        return new ResponseEntity<>(Map.of("isSuccess", isSuccess), HttpStatus.OK);
    }

}
