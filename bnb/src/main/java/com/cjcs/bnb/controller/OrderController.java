package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.PurchaseService;
import com.cjcs.bnb.service.RentalService;

import lombok.extern.slf4j.Slf4j;


// 이 컨트롤러에서 카트페이지, 결제페이지 url-메서드 매핑하셈

@Slf4j
@Controller
public class OrderController {

    @Autowired
    private MemberService mSer;

    @Autowired
    private PurchaseService pSer;

    @Autowired
    private RentalService rSer;



    @GetMapping("/cart")
    public String cart() {

        return "orderer/purchase_cart";
    }

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
    // public String payment() {

    //     return "payment";
    // }

    // @PostMapping 
    // public String payment() {

    //     return "payment";
    // }

}
