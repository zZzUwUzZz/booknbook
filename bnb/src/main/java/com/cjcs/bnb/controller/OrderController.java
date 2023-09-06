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
    public String placeOrder(@ModelAttribute("orderDto") OrderDto orderDto, Model model, HttpSession session) {
        // 주문 처리
        // 주문 정보, 결제 정보, 배송 정보를 받아서 주문을 처리하는 서비스 메서드 호출
        // 주문 성공 또는 실패에 따라 페이지 이동
        return "orderSuccess"; // 주문 성공 페이지
        // 또는
        // return "orderFailure"; // 주문 실패 페이지
    }

    // 배송지 정보 변경
    @PostMapping("/updateShoppingAddress")
    public String updateShoppingAddress(@ModelAttribute("shoppingAddressDto") ShoppingAddressDto shoppingAddressDto, Model model, HttpSession session) {
        // 배송지 정보 변경 처리
        // 새로운 배송지 정보를 받아서 업데이트
        return "redirect:/order/checkout"; // 주문 페이지로 리다이렉트
    }
}

// public class OrderController {

//     // 장바구니 페이지로 이동하는 메서드
//     @GetMapping("/cart")
//     public String cartPage(Model model) {
//         // 장바구니 내용을 모델에 추가 (예: cartItems)
//         // model.addAttribute("cartItems", cartItems);
//         return "cart"; // 장바구니 페이지 템플릿을 반환
//     }

//     // 장바구니에 상품 추가
//     @PostMapping("/cart/add")
//     public String addItemToCart(/*@RequestBody CartDto cartItem*/) {
//         // 아이템을 장바구니에 추가하는 로직을 수행
//         // cartService.addItemToCart(cartItem);
//         return "redirect:/cart"; // 장바구니 페이지로 다시 이동
//     }

//     // 장바구니에서 상품 제거
//     @PostMapping("/cart/remove")
//     public String removeItemFromCart(/*@RequestBody CartDto cartItem*/) {
//         // 아이템을 장바구니에서 제거하는 로직을 수행
//         // cartService.removeItemFromCart(cartItem);
//         return "redirect:/cart"; // 장바구니 페이지로 다시 이동
//     }

//     // 카트 페이지에서 결제를 수행하는 메서드 (POST)
//     @PostMapping("/cart/checkout")
//     public String performPayment(/*@RequestBody Cart cart*/) {
//         // 결제 처리 로직을 수행
//         // purchaseService.processPayment(cart);
//         return "redirect:/payment"; // 결제가 완료되면 결제 페이지로 이동
//     }

//     // 결제 페이지로 이동하는 메서드
//     @GetMapping("/payment")
//     public String paymentPage() {
//         // 결제 페이지를 반환s
//         return "payment";
//     }

//     // 결제 페이지에서 결제를 완료하는 메서드 (POST)
//     @PostMapping("/payment/complete")
//     public String completePayment(/*@RequestBody PaymentInfo paymentInfo*/) {
//         // 결제 완료 처리 로직을 수행
//         // paymentService.completePayment(paymentInfo);
//         return "redirect:/order/confirmation"; // 결제 완료 후 확인 페이지로 이동
//     }

//     // 주문 확인 페이지로 이동하는 메서드
//     @GetMapping("/order/confirmation")
//     public String orderConfirmationPage() {
//         // 주문 확인 페이지를 반환
//         return "order_confirmation";
//     }
// }
    
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


