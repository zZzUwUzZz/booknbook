package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dto.CartDto;
import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.PurchaseService;
import com.cjcs.bnb.service.RentalService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

// 이 컨트롤러에서 카트페이지, 결제페이지 url-메서드 매핑하셈

@Slf4j
@Controller
public class OrderController {

       @Autowired
    private OrderDao oDao;

    @Autowired
    private MemberService mSer;
    @Autowired
    private PurchaseService pSer;
    @Autowired
    private RentalService rSer;


    @GetMapping("/cart")
    public String cart(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        List<CartDto> cPList = oDao.getCartItemsByCId(c_id, "구매");
        log.info("cPList:{}", cPList);
        List<CartDto> cRList = oDao.getCartItemsByCId(c_id, "대여");
        log.info("cRList:{}", cRList);

        model.addAttribute("cPList", cPList);
        model.addAttribute("cRList", cRList);

        return "orderer/cart";
    }

    // @PostMapping
    // public String cart() {

    // return "cart";
    // }

    @GetMapping("/payment")
    public String payment() {

        return "orderer/payment";
    }

    // @PostMapping
    // public String payment() {

    // return "payment";
    // }
    
}
