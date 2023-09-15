package com.cjcs.bnb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dto.CartDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.service.OrderService;
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
    private MemberDao mDao;

    @Autowired
    private OrderService oSer;
    @Autowired
    private RentalService rSer;


    @GetMapping("/cart")    // 카트페이지
    public String cart(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        List<CartDto> cPList = oSer.getPurchaseCartAndStockCheck(c_id);
        List<CartDto> cRList = oSer.getRentalCartAndStockCheck(c_id);

        model.addAttribute("cPList", cPList);
        model.addAttribute("cRList", cRList);

        return "orderer/cart";
    }

    @PostMapping("/cart")    // 선택한항목 결제페이지로 넘기기
    public String cartToPayment(@RequestParam(required = false) ArrayList<Integer> pcart_idList,
                                @RequestParam(required = false) ArrayList<Integer> rcart_idList, Model model) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        MemberDto mDto = mDao.getCustomerInfoById(c_id);
        model.addAttribute("customer", mDto);

        List<CartDto> cList = new ArrayList<>();

        if (pcart_idList != null) {

            List<CartDto> cPList = oSer.purchaseCartToPayment(pcart_idList);
            model.addAttribute("cPList", cPList);

            int total_b_price = oSer.getPriceSum(cPList);
            model.addAttribute("total_b_price", total_b_price);

            cList.addAll(cPList);
        }

        if (rcart_idList != null) {

            List<CartDto> cRList = oSer.rentalCartToPayment(rcart_idList);
            model.addAttribute("cRList", cRList);

            int total_b_rent = oSer.getRentSum(cRList);
            model.addAttribute("total_b_rent", total_b_rent);

            cList.addAll(cRList);
        }

        int total_delivery_fee = oSer.getDeliveryFeeSum(cList);
        model.addAttribute("total_delivery_fee", total_delivery_fee);

        return "orderer/payment";
    }

    @PostMapping("/cartamountupdate")    // 구매카트항목 수량변경
    public ResponseEntity<Integer> updateCartAmount(@RequestParam int cart_id, @RequestParam int cart_amount) {

        oDao.updateCartAmount(cart_id, cart_amount);
        CartDto cDto = oDao.getCartByCartId(cart_id);
        Integer updated_payment = cDto.getB_price() * cDto.getCart_amount();

        return ResponseEntity.ok(updated_payment);
    }

    @PostMapping("/cartrentalperiodupdate")    // 대여카트항목 대여기간변경
    public ResponseEntity<Integer> updateCartRentalPeriod(@RequestParam int cart_id, @RequestParam int cart_rentalperiod) {

        oDao.updateCartRentalPeriod(cart_id, cart_rentalperiod);
        CartDto cDto = oDao.getCartByCartId(cart_id);
        Integer updated_payment = (Integer)(cDto.getB_rent() * cDto.getCart_rentalperiod() / 7);

        return ResponseEntity.ok(updated_payment);
    }

    @PostMapping("/cartitemdelete")    // 카트에서 개별항목 삭제
    public ResponseEntity<Void> deleteCartItem(@RequestParam int cart_id) {

        oDao.deleteCartItem(cart_id);

        return ResponseEntity.noContent().build();
    }

    @GetMapping("/payment")    // 결제페이지
    public String payment() {

        return "orderer/payment";
    }

    @PostMapping("/payment")    // 결제처리
    public String pay(@RequestParam(required = false) ArrayList<Integer> pcart_idList,
                      @RequestParam(required = false) ArrayList<Integer> rcart_idList, 
                      @RequestParam String o_delivery_sort,
                      @RequestParam String o_recip_addr, @RequestParam String o_recip_name, @RequestParam String o_recip_phone,
                      @RequestParam Integer o_total_pricerent, @RequestParam Integer o_total_deliveryfee, @RequestParam Integer o_total_payment,
                      RedirectAttributes rttr) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        Boolean stockCheck = oSer.stockCheck(pcart_idList, rcart_idList);
        log.info("stockCheck:{}", stockCheck);
        
        if (!stockCheck) {
            rttr.addFlashAttribute("msg", "결제 실패! 재고가 부족합니다.");
            return "redirect:/cart";
        }

        Boolean result = oSer.addOrder(c_id, pcart_idList, rcart_idList, o_delivery_sort, o_recip_addr, o_recip_name, o_recip_phone,
                                       o_total_pricerent, o_total_deliveryfee, o_total_payment);

        if (result) {
            return "redirect:/payment/success";
        } else {
            rttr.addFlashAttribute("msg", "결제 실패!");
            return "redirect:/cart";
        }
    }

    @GetMapping("/paymentlatefee")    // 연체료결제페이지
    public String paymentLatefee() {

        return "orderer/paymentLatefee";
    }

    @PostMapping("/paymentlatefee")    // 연체료결제처리
    public String payLatefee() {

        return "redirect:/payment/success";
    }
    
    @GetMapping("/payment/success")    // 결제완료페이지
    public String paymentSuccess() {

        return "orderer/paymentSuccess";
    }

}
