package com.cjcs.bnb.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dao.CategoryDao;
import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.RentalDto;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.FileService;
import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.OrderService;
import com.cjcs.bnb.service.PurchaseService;
import com.cjcs.bnb.service.RentalService;


import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import com.cjcs.bnb.service.StockService;


@Slf4j
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

    @Autowired
    private CategoryDao categoryDao;

    @Autowired
    private BookMapper bookDao;
  
    @Autowired
    private StockService stSer;


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

    // 등록된 도서 리스트
    @GetMapping("/book/list")
    public String sellerbooklist(String s_id,
            @RequestParam(required = false) String filter,
            @RequestParam(required = false) String keyword,
            Model model) {

        List<BookDto> bookList = stSer.SellerBookListDT(s_id, filter, keyword);
        model.addAttribute("SellerBookList", bookList);

        // 모든 도서의 상세 정보를 저장할 리스트
        List<BookDto> allBookDetails = new ArrayList<>();

        // 목록에 있는 모든 도서의 상세 정보를 가져옵니다.
        for (BookDto book : bookList) {
            BookDto bookDetail = stSer.BookInfoDt(book.getB_isbn(), book.getB_s_id());
            allBookDetails.add(bookDetail);
        }

        // 모델에 모든 도서의 상세 정보를 저장합니다.
        model.addAttribute("AllBookDetails", allBookDetails);

        return "seller/sellerBookList";
    }

    // 도서 신규등록 폼
    @GetMapping("/book/add")
    public String sellerbookadd(Model model) {

        // 중분류카테고리 드랍다운폼에 출력
        List<BookDto> categories_m = categoryDao.listMediumCategories();
        model.addAttribute("categories_m", categories_m);

        return "seller/sellerBookAdd";
    }

    @ResponseBody
    @PostMapping("/book/add/getsmallcategories")
    public List<BookDto> getsmallbymedium(@RequestParam String category_m_id) {

        // 선택한 중분류카테고리에 따라 소분류카테고리를 드랍다운폼에 비동기 출력
        List<BookDto> categories_s = categoryDao.listSmallCategories(category_m_id);

        return categories_s;
    }

    @ResponseBody
    @PostMapping("/book/add/isbncheck")
    public Boolean checkisbn(@RequestParam String b_isbn, HttpSession session) {

        String s_id = "seller001";   // 일단 하드코딩함!!!!!!!!!!!!!!! 나중에 수정!!!!!!!!!!!!!!!!!!!

        // 이미 등록된 isbn인지 체크
        BookDto book = bookDao.getBookByIsbn(s_id, b_isbn);
        if (book != null) return true;
        else return false;
    }

    // 도서 신규등록 처리
    @PostMapping("/book/add")
    public String sellerbookaddtodb(BookDto bookDto, HttpSession session) {

        String s_id = "seller001";   // 일단 하드코딩함!!!!!!!!!!!!!!! 나중에 수정!!!!!!!!!!!!!!!!!!!
        bookDto.setB_s_id(s_id);

        log.info("bookDto:{}", bookDto);
        bookDao.addNewBook(bookDto);

        return "redirect:/seller/book/list";
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

        return "seller/sellerRentCurr";
    }

    @PostMapping("/rent/curr/save")
    public ResponseEntity<List<RentalDto>> UpdateDeliStatus(@RequestBody List<RentalDto> requestData) {
        // 배송 상태 업데이트
        rSer.UpdateDeliStatus(requestData);
        return ResponseEntity.ok(requestData);
    }

    @PostMapping("/rent/curr/return")
    public ResponseEntity<String> UpdateRentStatus_Return(@RequestBody RentalDto requestData, String s_id) {
        int rentalStock = rSer.getRentalStock(requestData); // 대여 재고 조회
        int CountRentalRes = rSer.CountRentalRes(requestData); // 예약자 수 카운트
        
        if (rentalStock > 0) {
        // 대여재고 > 0
        // 반납완료, 재고 + 1
            rSer.UpdateRentStatus_Return(requestData); // 반납 완료로 상태 변경
            rSer.RentalStockAdd(requestData, s_id); // 대여 재고 +1
            return ResponseEntity.ok("반납 처리 및 대여 재고 증가");
        } else if (CountRentalRes == 0) {
        // 대여재고 = 0 예약자 = 0
        // 반납완료, 재고 + 1
            rSer.UpdateRentStatus_Return(requestData); // 반납 완료로 상태 변경
            rSer.RentalStockAdd(requestData, s_id); // 대여 재고 +1
            return ResponseEntity.ok("반납 처리 및 대여 재고 증가");
        } else {
        // 대여재고 = 0 예약자 > 0
        // 반납완료, 예약 1순위 상태 변경, 알림 보내기, 결제시한 날짜 추가
            rSer.UpdateRentStatus_Return(requestData); // 반납 완료로 상태 변경
            rSer.RentResStatus_First(requestData); // 예약 1순위 예약 상태 변경
            return ResponseEntity.ok("반납 처리 및 예약 1순위 처리");
        }
    }



    @GetMapping("/rent/return")
    public String sellerrentreturn(Model model) {

        String s_id = "seller001";   // 일단 하드코딩함!!!!!!!!!!!!!!! 나중에 수정!!!!!!!!!!!!!!!!!!!
        
        // 반납 내역 불러오기
        List<RentalDto> returnList = rSer.RentReturnList(s_id);
        log.info("returnList:{}", returnList);
        model.addAttribute("returnList", returnList);

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
