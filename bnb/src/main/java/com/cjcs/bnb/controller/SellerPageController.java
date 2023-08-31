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
    public String sellermain() {
        return "seller/sellerMain";
    }

    @PostMapping("/alert")
    public String selleralert() {
        return "seller/selleralert";
    }

    @GetMapping("/infoupdate")
    public String sellerinfoupdate() {
        return "seller/sellerinfoupdate";
    }
    
    // @PostMapping("/infoupdate")
    // public String sellerinfoupdate(MemberDto mDto) {
    //     boolean result = mSer.updateinfo(mDto);
    //     if (result) {
    //         alert("정보가 수정되었습니다.");
    //     } else {
    //         alert("정보 수정에 실패했습니다.");
    //     }
    //     return "sellerinfoupdate";
    // }
    
    @GetMapping("/csmember")
    public String sellercsmember(){
        return "seller/sellerCSMember";
    }

    @GetMapping("/book/list")
    public String sellerbooklist(){
        return "seller/sellerBookList";
    }

    @GetMapping("/book/add")
    public String sellerbookadd(){
        return "seller/sellerBookAdd";
    }

    @GetMapping("/book/detail")
    public String sellerbookdetail(){
        return "seller/sellerBookDetail";
    }
    

    @GetMapping("/rent/reserve")
    public String sellerrentreserve(){
        return "seller/sellerRentReserve";
    }

    @GetMapping("/rent/curr")
    public String sellerrentcurr(){
        return "seller/sellerRentCurr";
    }

    @GetMapping("/rent/return")
    public String sellerrentreturn(){
        return "seller/sellerRentReturn";
    }
    
    @GetMapping("/sell/history")
    public String sellersellhistory(){
        return "seller/sellerSellHistory";
    }

    @GetMapping("/sell/cancel")
    public String sellersellcancel(){
        return "seller/sellerSellCancel";
    }

    @GetMapping("/return/manage")
    public String sellerreturnmanage(){
        return "seller/sellerReturnManage";
    }

    @GetMapping("/account")
    public String selleraccount(){
        return "seller/sellerAccount";
    }
}
