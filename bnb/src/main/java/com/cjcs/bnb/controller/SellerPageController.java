package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/seller")
public class SellerPageController {
    
    @Autowired
    private OrderService oSer;

    @Autowired
    private MemberService mSer;




}
