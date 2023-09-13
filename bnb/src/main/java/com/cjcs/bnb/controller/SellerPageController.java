package com.cjcs.bnb.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.PurchaseDto;
import com.cjcs.bnb.dto.RentalDto;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.FileService;

import com.cjcs.bnb.service.MemberService;

import com.cjcs.bnb.service.OrderService;

import com.cjcs.bnb.service.PurchaseService;
import com.cjcs.bnb.service.RentalService;

import oracle.jdbc.proxy.annotation.Post;

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
    private BookService bSer;

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

    // 서점 회원 마이페이지 메인
    @GetMapping("/main")
    public String sellermain(String s_id, String rr_s_id, Model model) {

        // 오늘 판매 건수 카운트
        int getTodaySellCnt = oSer.getTodaySellCnt(s_id);
        model.addAttribute("TodaySellCnt", getTodaySellCnt);

        // 오늘 대여 건수 카운트
        int getTodayRentCnt = oSer.getTodayRentCnt(s_id);
        model.addAttribute("TodayRentCnt", getTodayRentCnt);

        // 오늘 예약 건수 카운트
        int getTodayRentResCnt = oSer.getTodayRentResCnt(rr_s_id);
        model.addAttribute("TodayRentResCnt", getTodayRentResCnt);

        // 오늘 총 주문 건수 카운트
        int TodayOrderCnt = getTodaySellCnt + getTodayRentCnt + getTodayRentResCnt;
        model.addAttribute("TodayOrderCnt", TodayOrderCnt);

        // 오늘 배송 준비중 건수 카운트
        int getTodayDeliveryPrepare = oSer.getTodayDeliveryPrepare(s_id);
        model.addAttribute("TodayDeliPre", getTodayDeliveryPrepare);

        // 오늘 배송중 건수 카운트
        int getTodayDeliverShip = oSer.getTodayDeliverShip(s_id);
        model.addAttribute("TodayDeliShip", getTodayDeliverShip);

        // 오늘 배송 준비완료 건수 카운트
        int getTodayDeliverComplete = oSer.getTodayDeliverComplete(s_id);
        model.addAttribute("TodayDeliComplete", getTodayDeliverComplete);

        // 오늘 즐겨찾기한 회원 수 카운트
        int getTodayBookmarkCnt = mSer.getTodayBookmarkCnt(s_id);
        model.addAttribute("TodayBookmarkCnt", getTodayBookmarkCnt);

        // 이번 주 즐겨찾기한 회원 수 카운트
        int getWeekBookmarkCnt = mSer.getWeekBookmarkCnt(s_id);
        model.addAttribute("WeekBookmarkCnt", getWeekBookmarkCnt);

        // 이번 달 즐겨찾기한 회원 수 카운트
        int getMonthBookmarkCnt = mSer.getMonthBookmarkCnt(s_id);
        model.addAttribute("MonthBookmarkCnt", getMonthBookmarkCnt);

        // 한 달 간 취소 요청 수 카운트
        int getMonthCancelRequest = oSer.getMonthCancelRequest(s_id);
        model.addAttribute("MonthCanelCnt", getMonthCancelRequest);

        // 한 달 간 반품/교환 요청 수 카운트
        int getMonthReturnRequest = oSer.getMonthReturnRequest(s_id);
        model.addAttribute("MonthReturnCnt", getMonthReturnRequest);

        // 오늘 정산 금액 합산
        // 기간을 오늘로 지정해줌
        SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
        Date now = new Date();
        String Start_Date = format.format(now);
        String End_Date = format.format(now);

        int getTodayCalculate = oSer.getCalculate(Start_Date, End_Date);
        model.addAttribute("TodaySumAmount", getTodayCalculate);

        // 한 달 간 정산 금액 합산
        // 기간을 한 달로 지정해줌
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
    public String sellercsmember(String s_id, Model model) {

        // 서점 이용 기록 있는 회원들 리스트 불러오기
        List<MemberDto> getCsMemberList = mSer.getCsMemberList(s_id);
        model.addAttribute("csMemberList", getCsMemberList);

        return "seller/sellerCSMember";
    }

    @GetMapping("/book/list")
    public String sellerbooklist(String s_id, @RequestParam(required = false) String filter,
            @RequestParam(required = false) String keyword, Model model) {

        // 등록한 도서 리스트 조회
        List<BookDto> getSellerBookList;

        if (filter != null && keyword != null) {
            // 검색을 위한 파라미터가 전달된 경우 실행
            getSellerBookList = bSer.searchSellerBookList(s_id, filter, keyword);
        } else {
            // 도서 전체 리스트 조회
            getSellerBookList = bSer.getSellerBookList(s_id);
        }

        model.addAttribute("SellerBookList", getSellerBookList);

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
    public String sellerrentreserve(String s_id, Model model) {

        // 예약 신청 리스트 불러오기
        List<RentalDto> resultList = rSer.RentResList(s_id);
        model.addAttribute("RentResList", resultList);

        return "seller/sellerRentReserve";
    }

    @PostMapping("/rent/reserve/accept")
    public ResponseEntity<String> ReserveAccept(@RequestBody RentalDto requestData) {
        rSer.ReserveAccept(requestData);
        return ResponseEntity.ok("예약 신청을 승인했습니다");
    }

    @PostMapping("/rent/reserve/refuse")
    public ResponseEntity<String> ReserveRefuse(@RequestBody RentalDto requestData) {
        rSer.ReserveRefuse(requestData);
        return ResponseEntity.ok("예약 신청을 거절했습니다");
    }

    @GetMapping("/rent/curr")
    public String sellerrentcurr(String s_id, Model model) {

        // 대여 현황 리스트 불러오기
        List<RentalDto> RentCurrentList = rSer.RentCurrentList(s_id);
        model.addAttribute("RentCurrentList", RentCurrentList);

        // 배송 상태명
        List<RentalDto> DeliveryStatusList = rSer.DeliveryStatusList();
        model.addAttribute("DeliveryStatusList", DeliveryStatusList);

        // 대여 상태명
        List<RentalDto> RentalSstatusList = rSer.RentalSstatusList();
        model.addAttribute("RentalSstatusList", RentalSstatusList);

        return "seller/sellerRentCurr";
    }

    @PostMapping("/rent/curr/save")
    public ResponseEntity<String> UpdateCurrStatus(@RequestBody List<RentalDto> requestData) {
        rSer.UpdateCurrStatus(requestData);
        return ResponseEntity.ok("현재 상태가 변경되었습니다!");
    }

    @GetMapping("/rent/return")
    public String sellerrentreturn(String s_id, Model model) {

        // 반납 내역 불러오기
        List<RentalDto> RentReturnList = rSer.RentReturnList(s_id);
        model.addAttribute("RentReturnList", RentReturnList);

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
        // 페이지 접속 시 기본값으로 0원 출력
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
        // 달력으로 지정한 날짜로 조회기간 출력
        model.addAttribute("Start_Date", Start_Date);
        model.addAttribute("End_Date", End_Date);

        // 기간 내 대여료
        int getCalculateRent = oSer.getCalculateRent(Start_Date, End_Date);
        model.addAttribute("CalculateRent", getCalculateRent);

        // 기간 내 연체료
        int getCalculateLate = oSer.getCalculateLate(Start_Date, End_Date);
        model.addAttribute("CalculateLate", getCalculateLate);

        // 기간 내 판매금액
        int getCalculateSell = oSer.getCalculateSell(Start_Date, End_Date);
        model.addAttribute("CalculateSell", getCalculateSell);

        // 기간 내 반품/환불 금액
        int getCalculateReturn = oSer.getCalculateReturn(Start_Date, End_Date);
        model.addAttribute("CalculateReturn", getCalculateReturn);

        // 수수료, 최종 정산 금액
        double CalculateTotal = getCalculateRent + getCalculateLate + getCalculateSell - getCalculateReturn;
        double CalculateCommission = CalculateTotal * 0.002;
        CalculateTotal -= CalculateCommission;

        model.addAttribute("CalculateTotal", CalculateTotal);
        model.addAttribute("CalculateCommission", CalculateCommission);

        return "seller/sellerCalculate";
    }

}
