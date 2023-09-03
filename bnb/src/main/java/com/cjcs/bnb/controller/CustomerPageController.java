package com.cjcs.bnb.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dao.PurchaseDao;
import com.cjcs.bnb.dao.RentalDao;
import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.RefExchDto;
import com.cjcs.bnb.dto.RentalReservationDto;
import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.NotificationService;
import com.cjcs.bnb.service.OrderService;
import com.cjcs.bnb.service.PurchaseService;
import com.cjcs.bnb.service.RentalService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/mypage")
public class CustomerPageController {

    @Autowired
    private MemberService mSer;
    @Autowired
    private NotificationService nSer;

    @Autowired
    private OrderService oSer;
    @Autowired
    private PurchaseService pSer;
    @Autowired
    private RentalService rSer;

    @Autowired
    private OrderDao oDao;
    @Autowired
    private PurchaseDao pDao;
    @Autowired
    private RentalDao rDao;


    @GetMapping
    public String mypage() {

        return "customer/mypage";
    }

    @GetMapping("/info")
    public String mypageInfo(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        MemberDto mDto = mSer.getCustomerInfoById(c_id);
        model.addAttribute("mDto", mDto);

        return "customer/mypageInfo";
    }

    @GetMapping("/updateinfo")
    public String mypageUpdateInfoFrm(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        MemberDto mDto = mSer.getCustomerInfoById(c_id);
        model.addAttribute("mDto", mDto);

        return "customer/mypageUpdateInfo";
    }

    @PostMapping("/updateinfo")
    public String mypageUpdateInfo(MemberDto updatedMDto, HttpSession session) {
        
        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        mSer.updateCustomerInfo(c_id, updatedMDto);

        return "redirect:/mypage/info";
    }


    @GetMapping("/orderlist")
    public String mypageOrderList(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        List<HashMap<String, String>> oList = oDao.getOrderListGroupByOId(c_id);
        model.addAttribute("oList", oList);
        
        return "customer/mypageOrderList";
    }


    @GetMapping("/orderdetail/{o_id}")
    public String mypageOrderDetail(@PathVariable("o_id") int o_id, Model model, HttpSession session) {

        HashMap<String, String> oInfo = oDao.getOrderInfoByOId(o_id);
        List<HashMap<String, String>> oPList = pDao.getPurchaseListByOId(o_id);
        List<HashMap<String, String>> oRList = rDao.getRentalListByOId(o_id);
        model.addAttribute("oInfo", oInfo);
        model.addAttribute("oPList", oPList);
        model.addAttribute("oRList", oRList);
        
        return "customer/mypageOrderDetail";
    }

    @GetMapping("/ordercancel")
    public String mypageOrderCancel(Integer o_id, HttpSession session, RedirectAttributes rttr) {

        oSer.cancelOrderByOId(o_id);

        rttr.addFlashAttribute("msg", "주문이 취소되었습니다.");

        return "redirect:/mypage/orderdetail/"+o_id;
    }


    @GetMapping("/purchaselist")
    public String mypagePurchaseList(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        List<HashMap<String, String>> pList = pDao.getPurchaseListByCId(c_id);
        model.addAttribute("pList", pList);

        return "customer/mypagePurchaseList";
    }

    @GetMapping("/rentallist")
    public String mypageRentalList(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        List<HashMap<String, String>> rList = rDao.getRentalListByCId(c_id);
        log.info("rList:{}", rList);
        model.addAttribute("rList", rList);

        return "customer/mypageRentalList";
    }


    @GetMapping("/refundExchange")
    public String mypageRefundExchange() {

        return "customer/mypageRefundExchange";
    }

    @GetMapping("/refundexchangelist")
    public String mypageRefundExchangeList(RefExchDto reDto) {

        return "customer/mypageRefundExchangeList";
    }

    @GetMapping("/rentalreservationlist")
    public String mypageRentalReservationList(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        List<RentalReservationDto> rrList = rSer.getReservationListByCId(c_id);
        log.info("rrList:{}", rrList);
        model.addAttribute("rrList", rrList);

        return "customer/mypageRentalReservationList";
    }

    @ResponseBody   // 비동기통신
    @PostMapping("/reservationcancel")
    public List<RentalReservationDto> cancelReservation(RentalReservationDto rrDto, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        rSer.cancelReservationByRRId(rrDto.getRr_id());

        List<RentalReservationDto> rrList = rSer.getReservationListByCId(c_id);

        return rrList;
    }

    @GetMapping("/favoritestores")
    public String mypageFavoriteStores(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        List<MemberDto> favStores = mSer.getFavStores(c_id);
        model.addAttribute("favStores", favStores);

        return "customer/mypageFavoriteStores";
    }

    @GetMapping("/favoritebooks")
    public String mypageFavoriteBooks(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        List<BookDto> favBooks = mSer.getFavBooks(c_id);
        System.out.println(favBooks);
        model.addAttribute("favBooks", favBooks);

        return "customer/mypageFavoriteBooks";
    }

}