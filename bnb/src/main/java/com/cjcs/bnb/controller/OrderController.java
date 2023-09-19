package com.cjcs.bnb.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dao.RentalDao;
import com.cjcs.bnb.dto.CartDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.RentalDto;
import com.cjcs.bnb.dto.RentalReservationDto;
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
    private RentalDao rDao;
    @Autowired
    private MemberDao mDao;

    @Autowired
    private OrderService oSer;
    @Autowired
    private RentalService rSer;


    //여기부터 일반결제

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

            List<CartDto> cPList = oSer.cartToPayment(pcart_idList);
            model.addAttribute("cPList", cPList);

            int total_b_price = oSer.getPriceSum(cPList);
            model.addAttribute("total_b_price", total_b_price);

            cList.addAll(cPList);
        }

        if (rcart_idList != null) {

            List<CartDto> cRList = oSer.cartToPayment(rcart_idList);
            model.addAttribute("cRList", cRList);

            int total_b_rent = oSer.getRentSum(cRList);
            model.addAttribute("total_b_rent", total_b_rent);

            cList.addAll(cRList);
        }

        int total_delivery_fee = oSer.getDeliveryFeeSum(cList);
        model.addAttribute("total_delivery_fee", total_delivery_fee);

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

        //결제버튼누르는 순간 재고 다시확인
        Boolean stockCheck = oSer.stockCheck(pcart_idList, rcart_idList);
        
        if (!stockCheck) {
            rttr.addFlashAttribute("msg", "결제 실패! 재고가 부족합니다.");
            return "redirect:/cart";
        }

        //재고있으면 결제처리
        Boolean result = oSer.addOrder(c_id, pcart_idList, rcart_idList, o_delivery_sort, o_recip_addr, o_recip_name, o_recip_phone,
                                       o_total_pricerent, o_total_deliveryfee, o_total_payment);

        if (result) {
            return "redirect:/payment/success";
        } else {
            rttr.addFlashAttribute("msg", "결제 실패!");
            return "redirect:/cart";
        }
    }

    //여기부터 대여순번항목결제

    @GetMapping("/restopay/{rr_id}")    // 대여순번항목 결제페이지로 넘기기
    public String resToPay(@PathVariable int rr_id, Model model) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        MemberDto mDto = mDao.getCustomerInfoById(c_id);
        model.addAttribute("customer", mDto);

        RentalReservationDto rrDto = rDao.getReservationByRRId(rr_id);
        model.addAttribute("rrItem", rrDto);

        return "orderer/paymentRes";
    }

    @PostMapping("/payment/res")    // 대여순번항목 결제처리
    public String payRes(@RequestParam Integer rr_id, @RequestParam String o_delivery_sort,
                         @RequestParam String o_recip_addr, @RequestParam String o_recip_name, @RequestParam String o_recip_phone,
                         @RequestParam Integer o_total_pricerent, @RequestParam Integer o_total_deliveryfee, @RequestParam Integer o_total_payment,
                         RedirectAttributes rttr) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        Boolean result = oSer.addResOrder(c_id, rr_id, o_delivery_sort, o_recip_addr, o_recip_name, o_recip_phone,
                                       o_total_pricerent, o_total_deliveryfee, o_total_payment);

        if (result) {
            return "redirect:/payment/success";
        } else {
            rttr.addFlashAttribute("msg", "결제 실패!");
            return "redirect:/mypage/rentalreservationlist";
        }
    }

    //여기부터 연체료결제

    @PostMapping("/latefeetopay")    // 연체료선택항목들 결제페이지로 넘기기
    public String latefeeToPay(@RequestParam ArrayList<Integer> r_idList, Model model) {

        List<RentalDto> lateList = new ArrayList<>();
        int total_latefee = 0;

        for (Integer r_id : r_idList) {

            RentalDto rDto = rDao.getRentalByRId(r_id);

            LocalDate currDate = LocalDate.now();
            LocalDate dueDate = ((Timestamp) rDto.getR_duedate()).toLocalDateTime().toLocalDate();
            Integer overdue_days = (int)(ChronoUnit.DAYS.between(dueDate, currDate));
            rDto.setOverdue_days(overdue_days);

            lateList.add(rDto);
            total_latefee += rDto.getR_latefee_total();
        }

        model.addAttribute("lateList", lateList);
        model.addAttribute("total_latefee", total_latefee);

        return "orderer/paymentLatefee";
    }

    @PostMapping("/payment/latefee")    // 연체료 결제처리
    public String payLatefee(@RequestParam ArrayList<Integer> r_idList, RedirectAttributes rttr) {

        try {

            for (Integer r_id : r_idList) {
                log.info("r_id:{}", r_id);
                rDao.updateLatefeePayDateByRId(r_id, "Y");
            }
            return "redirect:/payment/success";

        } catch (Exception e) {
            System.out.println("ERROR: "+e.getStackTrace());
            rttr.addFlashAttribute("msg", "결제 실패!");
            return "redirect:/mypage/rentallist";
        }

    }
    
    //결제공통

    @GetMapping("/payment/success")    // 결제완료페이지
    public String paymentSuccess() {

        return "orderer/paymentSuccess";
    }

}
