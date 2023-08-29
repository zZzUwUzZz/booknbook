package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class CustomerPageController {
    
    //의존성주입

    @Autowired
    private OrderService oSer;

    @Autowired
    private MemberService mSer;


    //여기부터 페이지-메서드 매핑

    @PostMapping("/")
    public String mypage() {

        return "mypage";
    }
    
    @PostMapping("/info")
    public String mypageInfo() {

        return "mypageInfo";
    }

    @GetMapping("/updateinfo")
    public String mypageUpdateInfo() {

        return "mypageUpdateInfo";
    }

    @PostMapping("/updateinfo")
    public String mypageUpdateInfo(MemberDto mDto) {
        
        boolean result = mSer.updateinfo(mDto);
        if (result) {
            return "mypageInfo";
        } else {
            return "redirect:/mypage/updateinfo";
        }
        
    }

}