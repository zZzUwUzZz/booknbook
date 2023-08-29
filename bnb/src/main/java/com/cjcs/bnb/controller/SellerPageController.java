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
@RequestMapping("/seller")
public class SellerPageController {

    @Autowired
    private OrderService oSer;

    @Autowired
    private MemberService mSer;

    @GetMapping("/main")
    public String main() {
        return "sellermain";
    }

    @PostMapping("/alert")
    public String selleralert() {
        return "selleralert";
    }

    @GetMapping("/infoupdate")
    public String sellerinfoupdate() {
        return "sellerinfoupdate";
    }

    @PostMapping("/infoupdate")
    public String sellerinfoupdate(MemberDto mDto) {
        boolean result = mSer.updateinfo(mDto);
        if (result) {
            alert("정보가 수정되었습니다.");
        } else {
            alert("정보 수정에 실패했습니다.");
        }
        return "sellerinfoupdate";
    }
    
    private void alert(String string) {
    }

}
