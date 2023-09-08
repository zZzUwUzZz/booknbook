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

@Controller
public class FavoriteController {
     @Autowired
    private FavoriteService favoriteService;

//     @GetMapping("/getFavoriteStatus")
//     @ResponseBody
//     public Map<String, Object> getFavoriteStatus(@RequestParam String userId, @RequestParam String storeId) {
//         int state = favoriteService.isFavorite(userId, storeId);
//         Map<String, Object> result = new HashMap<>();
//         result.put("isFavorite", state == 1);
//         return result;
//     }


// @PostMapping("/toggleFavorite")
// public ResponseEntity<?> toggleFavorite(@RequestParam String userId, @RequestParam String storeId) {
//     System.out.println("toggleFavorite called with userId: " + userId + ", storeId: " + storeId);  // 로그 추가
//     boolean isFavorite = favoriteService.toggleFavorite(userId, storeId);
//     return new ResponseEntity<>(Map.of("isFavorite", isFavorite), HttpStatus.OK);
// }
 
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
