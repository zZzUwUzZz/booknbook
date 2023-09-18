package com.cjcs.bnb.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cjcs.bnb.dto.FavBookDTO;
import com.cjcs.bnb.service.FavBookService;
import com.cjcs.bnb.service.FavoriteService;

@RestController
public class FavoriteController {
    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private FavBookService favBookService;

    // 즐겨찾는 서점
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

    // 찜한 도서 추가 또는 제거
    @PostMapping("/checkFavBook")
    public ResponseEntity<Integer> checkFavBook(@RequestBody FavBookDTO favBookDTO) {
        System.out.println("도서 찜하기 상태 :  " + favBookDTO);
        Integer favState = favBookService.checkAndToggleFav(favBookDTO);
        return new ResponseEntity<>(favState, HttpStatus.OK);
    }

    // 찜하기 상태 체크
    @GetMapping("/getFavState")
    public ResponseEntity<Integer> getFavState(FavBookDTO favBookDTO) {
        Integer favState = favBookService.getFavState(favBookDTO);
        return new ResponseEntity<>(favState, HttpStatus.OK);
    }

}
