package com.cjcs.bnb.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.FileService;

import com.cjcs.bnb.service.MemberService;

import com.cjcs.bnb.service.OrderService;

import com.cjcs.bnb.service.PurchaseService;
import com.cjcs.bnb.service.RentalService;

import oracle.jdbc.proxy.annotation.Post;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/seller")
public class SellerPageController {

    @Autowired
    private MemberService mSer;

    @Autowired
    private PurchaseService pSer;

    @Autowired
    private RentalService rSer;

    @Autowired
    private OrderService oSer;

    @Autowired
    private FileService fileService; // MyBatis mapper

    // 서점 정보 페이지
    @GetMapping
    public String sellerpage() {

        return "seller/sellerInfo";
    }

    // 서점 정보 수정 페이지
    @GetMapping("/seller/settings/account")
    public String editSeller(@PathVariable String sellerId) {

        // TODO: 필요한 로직 (예: 서점 정보 로드)
        return "seller/sellerInfoDetail"; // 'editSeller'는 서점 정보를 수정하는 HTML 페이지를 가리킵니다.
    }

    @GetMapping("/main")
    public String sellermain(String s_id, String rr_s_id, Model model) {

        int getTodaySellCnt = oSer.getTodaySellCnt(s_id);
        model.addAttribute("SellCnt", getTodaySellCnt);

        int getTodayRentCnt = oSer.getTodayRentCnt(s_id);
        model.addAttribute("RentCnt", getTodayRentCnt);

        int getTodayRentResCnt = oSer.getTodayRentResCnt(rr_s_id);
        model.addAttribute("RentResCnt", getTodayRentResCnt);

        int TodayOrderCnt = getTodaySellCnt + getTodayRentCnt + getTodayRentResCnt;
        model.addAttribute("OrderCnt", TodayOrderCnt);

        int getTodayDeliveryPrepare = oSer.getTodayDeliveryPrepare(s_id);
        model.addAttribute("DeliPre", getTodayDeliveryPrepare);

        int getTodayDeliverShip = oSer.getTodayDeliverShip(s_id);
        model.addAttribute("DeliShip", getTodayDeliverShip);

        int getTodayDeliverComplete = oSer.getTodayDeliverComplete(s_id);
        model.addAttribute("DeliComplete", getTodayDeliverComplete);

        int getTodayBookmarkCnt = mSer.getTodayBookmarkCnt(s_id);
        model.addAttribute("TodayBookmark", getTodayBookmarkCnt);

        int getWeekBookmarkCnt = mSer.getWeekBookmarkCnt(s_id);
        model.addAttribute("WeekBookmark", getWeekBookmarkCnt);

        int getMonthBookmarkCnt = mSer.getMonthBookmarkCnt(s_id);
        model.addAttribute("MonthBookmark", getMonthBookmarkCnt);

        int getMonthCancelRequest = oSer.getMonthCancelRequest(s_id);
        model.addAttribute("CanelCnt", getMonthCancelRequest);

        int getMonthReturnRequest = oSer.getMonthReturnRequest(s_id);
        model.addAttribute("ReturnCnt", getMonthReturnRequest);

        SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
        Date now = new Date();
        String Start_Date = format.format(now);
        String End_Date = format.format(now);

        int getTodayCalculate = oSer.getCalculate(Start_Date, End_Date);
        model.addAttribute("TodaySumAmount", getTodayCalculate);

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.MONTH, -1);
        Date oneMonthAgo = calendar.getTime();
        Start_Date = format.format(oneMonthAgo);

        try {
            Start_Date = format.format(oneMonthAgo);
            End_Date = format.format(now);
        } catch (Exception e) {
            // 날짜 포맷팅 예외 처리
            Start_Date = "";
            End_Date = "";
            e.printStackTrace(); // 예외 정보 로깅
        }
        int getMonthSumAmount = oSer.getCalculate(Start_Date, End_Date);
        model.addAttribute("MonthSumAmount", getMonthSumAmount);

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
    // boolean result = mSer.updateinfo(mDto);
    // if (result) {
    // alert("정보가 수정되었습니다.");
    // } else {
    // alert("정보 수정에 실패했습니다.");
    // }
    // return "sellerinfoupdate";
    // }

    @GetMapping("/csmember")
    public String sellercsmember(Model model) {
        List<MemberDto> getCsMemberList = mSer.getCsMemberList();
        model.addAttribute("csMemberList", getCsMemberList);

        return "seller/sellerCSMember";
    }

    @GetMapping("/book/list")
    public String sellerbooklist(String b_s_id, Model model) {
        // List<BookDto> books = BookService.getSellerBookList(b_s_id);
        // model.addAttribute("books", books);

        return "seller/sellerBookList";
    }

    @GetMapping("/book/add")
    public String sellerbookadd() {
        return "seller/sellerBookAdd";
    }

    @GetMapping("/book/detail")
    public String sellerbookdetail() {
        return "seller/sellerBookDetail";
    }

    @GetMapping("/rent/reserve")
    public String sellerrentreserve() {
        return "seller/sellerRentReserve";
    }

    @GetMapping("/rent/curr")
    public String sellerrentcurr() {
        return "seller/sellerRentCurr";
    }

    @GetMapping("/rent/return")
    public String sellerrentreturn() {
        return "seller/sellerRentReturn";
    }

    @GetMapping("/sell/history")
    public String sellersellhistory() {
        return "seller/sellerSellHistory";
    }

    @GetMapping("/sell/cancel")
    public String sellersellcancel() {
        return "seller/sellerSellCancel";
    }

    @GetMapping("/return/manage")
    public String sellerreturnmanage() {
        return "seller/sellerReturnManage";
    }

    @GetMapping("/calculate")
    public String sellercalculate(Model model) {
        model.addAttribute("CalculateRent", "0");
        model.addAttribute("CalculateLate", "0");
        model.addAttribute("CalculateSell", "0");
        model.addAttribute("CalculateReturn", "0");

        return "seller/sellerCalculate";
    }

    @PostMapping("/calculate")
    public String calculate(
            @RequestParam("Start_Date") String Start_Date,
            @RequestParam("End_Date") String End_Date,
            Model model) {
        model.addAttribute("Start_Date", Start_Date);
        model.addAttribute("End_Date", End_Date);

        int getCalculateRent = oSer.getCalculateRent(Start_Date, End_Date);
        model.addAttribute("CalculateRent", getCalculateRent);

        int getCalculateLate = oSer.getCalculateLate(Start_Date, End_Date);
        model.addAttribute("CalculateLate", getCalculateLate);

        int getCalculateSell = oSer.getCalculateSell(Start_Date, End_Date);
        model.addAttribute("CalculateSell", getCalculateSell);

        int getCalculateReturn = oSer.getCalculateReturn(Start_Date, End_Date);
        model.addAttribute("CalculateReturn", getCalculateReturn);

        double CalculateTotal = getCalculateRent + getCalculateLate + getCalculateSell - getCalculateReturn;
        double CalculateCommission = CalculateTotal * 0.002;
        CalculateTotal -= CalculateCommission;

        model.addAttribute("CalculateTotal", CalculateTotal);
        model.addAttribute("CalculateCommission", CalculateCommission);

        return "seller/sellerCalculate";
    }

}
