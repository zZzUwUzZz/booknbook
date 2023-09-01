package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.service.MemberService;
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
    private PurchaseService pSer;

    @Autowired
    private RentalService rSer;



    @GetMapping // 일단 GET으로 해놓고 나중에 POST로 바꾸기...
    public String mypage() {

        return "customer/mypage";
    }

    @GetMapping("/info") // 일단 GET으로 해놓고 나중에 POST로 바꾸기...
    public String mypageInfo(Model model, HttpSession session) {

        //이재락이 회원가입이랑 로그인 아직 안해서 하드코딩함.
        String c_id = "customer001";
        //나중에 완성하면 윗줄 삭제하기.

        MemberDto mDto = mSer.getCustomerInfo(c_id);
        model.addAttribute("mDto", mDto);

        return "customer/mypageInfo";
    }

    @GetMapping("/updateinfo")
    public String mypageUpdateInfo(Model model, HttpSession session) {

        //이재락이 회원가입이랑 로그인 아직 안해서 하드코딩함.
        String c_id = "customer001";
        //나중에 완성하면 윗줄 삭제하기.

        MemberDto mDto = mSer.getCustomerInfo(c_id);
        model.addAttribute("mDto", mDto);

        return "customer/mypageUpdateInfo";
    }

    @PostMapping("/updateinfo")
    public String mypageUpdateInfo(MemberDto mDto) {

        try {
            mSer.updateCustomerInfo(mDto);
            return "redirect:/mypage/info";
        } catch(Exception e) {
            return "redirect:/mypage/updateinfo";
        }

    }

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

    @GetMapping("/favoritestores") // 일단 GET으로 해놓고 나중에 POST로 바꾸기...
    public String mypageFavoriteStores(Model model, HttpSession session) {

        //이재락이 회원가입이랑 로그인 아직 안해서 하드코딩함.
        String c_id = "customer001";
        //나중에 완성하면 윗줄 삭제하기.

        List<MemberDto> favStores = mSer.getFavStores(c_id);
        model.addAttribute("favStores", favStores);

        return "customer/mypageFavoriteStores";
    }

    @GetMapping("/favoritebooks") // 일단 GET으로 해놓고 나중에 POST로 바꾸기...
    public String mypageFavoriteBooks(Model model, HttpSession session) {

        //이재락이 회원가입이랑 로그인 아직 안해서 하드코딩함.
        String c_id = "customer001";
        //나중에 완성하면 윗줄 삭제하기.

        List<BookDto> favBooks = mSer.getFavBooks(c_id);
        System.out.println(favBooks);
        model.addAttribute("favBooks", favBooks);

        return "customer/mypageFavoriteBooks";
    }

}