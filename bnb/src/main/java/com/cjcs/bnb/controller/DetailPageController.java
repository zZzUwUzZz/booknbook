package com.cjcs.bnb.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.PathVariable;


import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.NotificationService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

// 이 컨트롤러에서 책상세페이지, 서점상세페이지 url-메서드 매핑하셈

@Slf4j
@Controller
public class DetailPageController {

    @Autowired
    private MemberService mSer; // 책상세에서 찜, 서점상세에서 즐겨찾기 할 때 필요
    @Autowired
    private NotificationService nSer; // 책상세에서 입고알림신청, 대여예약 할 때 필요
    @Autowired
    private BookService bSer;



    // 서점 즐겨찾기

    // @PostMapping("/toggleFavorite")
    // public ResponseEntity<?> toggleFavorite(@RequestParam String userId,
    // @RequestParam String storeId) {
    // boolean isFavorite = favoriteService.toggleFavorite(userId, storeId);

    // return new ResponseEntity<>(Map.of("isFavorite", isFavorite), HttpStatus.OK);
    // }

    @GetMapping("/bookdetail/{isbn}/{sellerId}")
    public String bookDetail(@PathVariable String isbn, @PathVariable String sellerId, Model model) {
        // 여기서 isbn과 sellerId를 사용해 DB에서 해당 책의 상세 정보를 가져옵니다.
        BookDto bDto = bSer.findBookByIsbnAndSellerId(isbn, sellerId);
        model.addAttribute("bDto", bDto);
        return "/bookdetail";
    }


}