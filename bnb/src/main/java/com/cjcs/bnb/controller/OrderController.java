package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.cjcs.bnb.dto.OrderDto;
import com.cjcs.bnb.dto.ShoppingAddressDto;
import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.OrderService;
import com.cjcs.bnb.service.RentalService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

//의존성 주입
@Slf4j
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService oSer;

    @Autowired
    private MemberService mSer;

    @Autowired
    private PurchaseService pSer;

    @Autowired
    private RentalService reSer;


    // 주문 페이지로 이동
    @GetMapping("/checkout")
    public String checkoutPage(Model model, HttpSession session) {
        // 주문 페이지 관련 처리
        // 주문 상품 목록, 배송지 정보 등을 모델에 추가
        return "checkout"; // checkout.jsp로 이동
    }

    // 주문 처리
    @PostMapping("/placeOrder")
    public String placeOrder(@ModelAttribute("orderDto") OrderDto oDto, Model model, HttpSession session) {
        // 주문 처리
        // 주문 정보, 결제 정보, 배송 정보를 받아서 주문을 처리하는 서비스 메서드 호출
        // 주문 성공 또는 실패에 따라 페이지 이동
        return "orderSuccess"; // 주문 성공 페이지
        // 또는
        // return "orderFailure"; // 주문 실패 페이지
    }

    // 배송지 정보 변경
    @PostMapping("/updateShoppingAddress")
    public String updateShoppingAddress(@ModelAttribute("ShoppingAddressDto") ShoppingAddressDto SADto, Model model, HttpSession session) {
        // 배송지 정보 변경 처리
        // 새로운 배송지 정보를 받아서 업데이트
        return "redirect:/order/checkout"; // 주문 페이지로 리다이렉트
    }
}
//     //의존성주입.. 수정,추가 알아서하셈

//     @Autowired
//     private OrderService oSer;

//     @Autowired
//     private MemberService mSer;


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


