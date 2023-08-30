package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {
    
    //의존성주입.. 수정,추가 알아서하셈

    @Autowired
    private OrderService oSer;

    @Autowired
    private MemberService mSer;


    //여기부터 페이지-메서드 매핑

    // @GetMapping
    // public String cart() {

    //     return "cart";
    // }

    // @PostMapping  
    // public String cart() {

    //     return "cart";
    // }

    // @GetMapping 
    // public String order() {

    //     return "order";
    // }

    // @PostMapping 
    // public String order() {

    //     return "order";
    // }

}
