package com.cjcs.bnb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dao.RentalDao;
import com.cjcs.bnb.dto.CartDto;
import com.cjcs.bnb.dto.RentalDto;
import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.PurchaseService;
import com.cjcs.bnb.service.RentalService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.f;

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
    @Autowired
    private RentalDao rentalDao;
  

    @GetMapping("/cart")    // 카트페이지
    public String cart(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        List<CartDto> cPList = oDao.getPurchaseCartByCId(c_id);
        List<CartDto> cRList = oDao.getRentalCartByCId(c_id);

        model.addAttribute("cPList", cPList);
        model.addAttribute("cRList", cRList);

        return "orderer/cart";
    }

    @PostMapping("/cart")    // 선택한항목 결제페이지로 넘기기
    public String cartToPayment() {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        return "orderer/payment";
    }

    @GetMapping("/cartamountupdate/{cart_id}/{cart_amount}")    // 구매카트항목 수량변경
    public String updateCartAmount(@PathVariable int cart_id, @PathVariable int cart_amount) {

        oDao.updateCartAmount(cart_id, cart_amount);

        return "redirect:/cart";
    }

    @GetMapping("/cartrentalperiodupdate/{cart_id}/{cart_rentalperiod}")    // 대여카트항목 대여기간변경
    public String updateCartRentalPeriod(@PathVariable int cart_id, @PathVariable int cart_rentalperiod) {

        oDao.updateCartRentalPeriod(cart_id, cart_rentalperiod);

        return "redirect:/cart";
    }

    @GetMapping("/cartitemdelete/{cart_id}")    // 카트에서 개별항목 삭제
    public String deleteCartItem(@PathVariable int cart_id) {

        oDao.deleteCartItem(cart_id);

        return "redirect:/cart";
    }

    @GetMapping("/payment")    // 결제페이지
    public String payment() {

        return "orderer/payment";
    }

    @PostMapping("/payment")    // 결제처리
    public String pay() {

        return "redirect:/payment/success";
    }

    @GetMapping("/paymentlatefee")    // 연체료결제페이지 
    public String paymentLateFee(@RequestParam ArrayList<Integer> r_idList, Model model) {
        Map<String, Object> lateFeeInfo = rSer.getLateFeeInfo(r_idList);
        model.addAttribute("lateFeeInfo", lateFeeInfo);
        return "orderer/paymentLateFee";  
    }

    @PostMapping("/payLatefee")    // 연체료결제처리
    public String payLatefee() {
         
        return "redirect:/payment/success";
    }
    
    @GetMapping("/payment/success")    // 결제완료페이지
    public String paymentSuccess() {

        return "orderer/paymentSuccess";
    }

}
