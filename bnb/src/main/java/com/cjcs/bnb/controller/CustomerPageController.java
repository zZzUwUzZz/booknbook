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

    @GetMapping                              // 일단 GET으로 해놓고 나중에 POST로 바꾸기...
    public String mypage() {

        return "customer/mypage";
    }
    
    @GetMapping("/info")                     // 일단 GET으로 해놓고 나중에 POST로 바꾸기...
    public String mypageInfo() {

        return "customer/mypageInfo";
    }

    @GetMapping("/updateinfo")
    public String mypageUpdateInfo() {

        return "customer/mypageUpdateInfo";
    }

    // @PostMapping("/updateinfo")
    // public String mypageUpdateInfo(MemberDto mDto) {
        
    //     boolean result = mSer.updateinfo(mDto);
    //     if (result) {
    //         return "mypage/info";
    //     } else {
    //         return "redirect:/mypage/updateinfo";
    //     }
        
    // }

    @GetMapping("/purchaselist")
    public String mypagePurchaseList() {

        return "customer/mypagePurchaseList";
    }


    @GetMapping("/refundexchangelist")
    public String mypageRefundExchangeList() {

        return "customer/mypageRefundExchangeList";
    }


    @GetMapping("/rentallist")
    public String mypageRentalList() {

        return "customer/mypageRentalList";
    }


    @GetMapping("/rentalreservationlist")
    public String mypageRentalReservationList() {

        return "customer/mypageRentalReservationList";
    }



    @GetMapping("/favoritestores")                     // 일단 GET으로 해놓고 나중에 POST로 바꾸기...
    public String mypageFavoriteStores() {

        return "customer/mypageFavoriteStores";
    }


    @GetMapping("/favoritebooks")                     // 일단 GET으로 해놓고 나중에 POST로 바꾸기...
    public String mypageFavoriteBooks() {

        return "customer/mypageFavoriteBooks";
    }

}