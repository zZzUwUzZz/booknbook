package com.cjcs.bnb.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dao.PurchaseDao;
import com.cjcs.bnb.dao.RentalDao;
import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.PurchaseDto;
import com.cjcs.bnb.dto.RefExchDto;
import com.cjcs.bnb.dto.RentalDto;
import com.cjcs.bnb.dto.RentalReservationDto;
import com.cjcs.bnb.dto.SearchDto;
import com.cjcs.bnb.service.BoardService;
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
    private BoardService bSer;

    @Autowired
    private MemberDao mDao;
    @Autowired
    private OrderDao oDao;
    @Autowired
    private PurchaseDao pDao;
    @Autowired
    private RentalDao rDao;


    @GetMapping    // 일반회원 마이페이지홈
    public String mypage(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.
        model.addAttribute("c_id", c_id);

        HashMap<String, String> latestFav = mSer.getLatestFavStoreAndBookByCId(c_id);
        int num_of_currRE = pDao.countCurrentRefExchByCId(c_id);
        int num_of_currR = rDao.countCurrentRentalByCId(c_id);

        model.addAttribute("latestFav", latestFav);
        model.addAttribute("num_of_currRE", num_of_currRE);
        model.addAttribute("num_of_currR", num_of_currR);

        List<RefExchDto> curr_reList = pDao.getCurrentRefExchListByCId(c_id);
        List<HashMap<String, String>> curr_rList = rDao.getCurrentRentalListByCId(c_id);
        List<PurchaseDto> pList = pDao.getLatest5PurchaseListByCId(c_id);
        List<RentalDto> rList = rDao.getLatest5RentalListByCId(c_id);

        model.addAttribute("curr_reList", curr_reList);
        model.addAttribute("curr_rList", curr_rList);
        model.addAttribute("pList", pList);
        model.addAttribute("rList", rList);

        return "customer/mypage";
    }

    @GetMapping("/info")    // 일반회원 회원정보조회
    public String mypageInfo(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        MemberDto mDto = mSer.getCustomerInfoById(c_id);
        model.addAttribute("mDto", mDto);

        return "customer/mypageInfo";
    }

    @GetMapping("/updateinfo")     // 일반회원 회원정보수정폼
    public String mypageUpdateInfoFrm(Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        MemberDto mDto = mSer.getCustomerInfoById(c_id);
        model.addAttribute("mDto", mDto);

        return "customer/mypageUpdateInfo";
    }

    @PostMapping("/updateinfo")    // 일반회원 회원정보수정처리
    public String mypageUpdateInfo(MemberDto updatedMDto, HttpSession session) {
        
        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        mSer.updateCustomerInfo(c_id, updatedMDto);

        return "redirect:/mypage/info";
    }


    @GetMapping("/orderlist")    // 주문내역
    public String mypageOrderList(SearchDto sDto, Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.
        sDto.setC_id(c_id);

        List<HashMap<String, String>> oList = oDao.getOrderListByDateRange(sDto);
        String pageHtml = bSer.getPageboxHtml(sDto, "/mypage/orderlist");
        
        if (oList != null) {
            session.setAttribute("pageNum", sDto.getPageNum());
            model.addAttribute("oList", oList);
            model.addAttribute("pageHtml", pageHtml);
        }

        return "customer/mypageOrderList";
    }

    @GetMapping("/orderdetail/{o_id}")    // 주문상세
    public String mypageOrderDetail(@PathVariable("o_id") int o_id, Model model, HttpSession session) {

        HashMap<String, Object> oInfo = oDao.getOrderInfoByOId(o_id);
        List<HashMap<String, Object>> oPList = pDao.getPurchaseListByOId(o_id);
        List<HashMap<String, Object>> oRList = rDao.getRentalListByOId(o_id);

        model.addAttribute("oInfo", oInfo);
        model.addAttribute("oPList", oPList);
        model.addAttribute("oRList", oRList);

        Boolean delivered = oSer.hasAtLeastOneDelivered(oPList, oRList);
        log.info("delivered:{}", delivered);
        model.addAttribute("delivered", delivered);
        
        return "customer/mypageOrderDetail";
    }

    @GetMapping("/ordercancel")    // 주문취소처리
    public String mypageOrderCancel(Integer o_id, HttpSession session, RedirectAttributes rttr) {

        oSer.cancelOrderByOId(o_id);

        rttr.addFlashAttribute("msg", "주문이 취소되었습니다.");

        return "redirect:/mypage/orderdetail/"+o_id;
    }


    @GetMapping("/purchaselist")    // 구매내역
    public String mypagePurchaseList(SearchDto sDto, Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.
        sDto.setC_id(c_id);

        List<HashMap<String, Object>> pList = pDao.getPurchaseListByDateRange(sDto);
        String pageHtml = bSer.getPageboxHtml(sDto, "/mypage/purchaselist");

        if (pList != null) {

            for (HashMap<String, Object> pItem : pList) {

                LocalDate currDate = LocalDate.now();
                Timestamp deliDate = (Timestamp) pItem.get("p_deliverydate");

                if (deliDate == null) {
                    pItem.put("after_a_week", "false");

                } else {
                    LocalDate aWeekAfterDeliveryDate = (deliDate).toLocalDateTime().toLocalDate().plusDays(7);
                    if (currDate.isAfter(aWeekAfterDeliveryDate)) {
                        pItem.put("after_a_week", "true");
                    } else {
                        pItem.put("after_a_week", "false");
                    }
                }
            }

            session.setAttribute("pageNum", sDto.getPageNum());
            model.addAttribute("pList", pList);
            model.addAttribute("pageHtml", pageHtml);
        }

        return "customer/mypagePurchaseList";
    }

    @GetMapping("/rentallist")    // 대여내역
    public String mypageRentalList(SearchDto sDto, Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.
        sDto.setC_id(c_id);

        List<HashMap<String, String>> rList = rDao.getRentalListByDateRange(sDto);
        String pageHtml = bSer.getPageboxHtml(sDto, "/mypage/rentallist");

        if (rList != null) {
            session.setAttribute("pageNum", sDto.getPageNum());
            model.addAttribute("rList", rList);
            model.addAttribute("pageHtml", pageHtml);
        }

        return "customer/mypageRentalList";
    }

    @GetMapping("/refundexchange")     // 교환반품신청폼
    public String mypageRefundExchangeFrm(@RequestParam ArrayList<Integer> p_idList, Model model) {

        log.info("p_idList:{}", p_idList);

        List<HashMap<String, String>> pList_re = new ArrayList<>();
        
        for (Integer p_id : p_idList) {
            HashMap<String, String> pItem = pDao.getPurchaseItemByPId(p_id);
            pList_re.add(pItem);
        }
        log.info("pList_re:{}", pList_re);
        model.addAttribute("pList_re", pList_re);
        
        return "customer/mypageRefundExchange";
    }

    @PostMapping("/refundexchange")     // 교환반품요청처리
    public String mypageRefundExchange(@RequestParam String re_sort, @RequestParam ArrayList<Integer> p_idList, 
                                       @RequestParam ArrayList<Integer> re_amountList, @RequestParam String re_reason, 
                                       Model model, RedirectAttributes rttr) {
        
        log.info("re_sort:{}", re_sort);
        log.info("p_idList:{}", p_idList);
        log.info("re_amountList:{}", re_amountList);
        log.info("re_reason:{}", re_reason);

        pSer.requestRefExch(re_sort, p_idList, re_amountList, re_reason);

        rttr.addFlashAttribute("msg", "신청되었습니다.");

        return "redirect:/mypage/refundexchangelist";
    }

    @GetMapping("/refundexchangelist")    // 교환반품내역
    public String mypageRefundExchangeList(SearchDto sDto, Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.
        sDto.setC_id(c_id);
        log.info("re_id:{}", sDto);

        List<RefExchDto> reList = pDao.getRefExchListByDateRange(sDto);
        String pageHtml = bSer.getPageboxHtml(sDto, "/mypage/refundexchangelist");
        log.info("reList:{}", reList);

        if (reList != null) {
            session.setAttribute("pageNum", sDto.getPageNum());
            model.addAttribute("reList", reList);
            model.addAttribute("pageHtml", pageHtml);
        }

        return "customer/mypageRefundExchangeList";
    }

    @GetMapping("/refundexchangecancel/{re_id}")    // 교환반품신청취소처리
    public String cancelRefExchRequest(@PathVariable("re_id") int re_id) {

        pDao.deleteRefExchList(re_id);

        return "redirect:/mypage/refundexchangelist";
    }

    @GetMapping("/rentalreservationlist")    // 대여예약내역
    public String mypageRentalReservationList(SearchDto sDto, Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.
        sDto.setC_id(c_id);

        List<RentalReservationDto> rrList = rDao.getReservationListByDateRange(sDto);
        String pageHtml = bSer.getPageboxHtml(sDto, "/mypage/rentalreservationlist");

        if (rrList != null) {
            session.setAttribute("pageNum", sDto.getPageNum());
            model.addAttribute("rrList", rrList);
            model.addAttribute("pageHtml", pageHtml);
        }

        return "customer/mypageRentalReservationList";
    }

    @ResponseBody   // 비동기통신(굳이 비동기로 할 필요 없는 페이지인데 그냥 해보고 싶어서 해봄 -_-...)
    @PostMapping("/reservationcancel")    // 대여예약취소처리
    public List<RentalReservationDto> cancelReservation(RentalReservationDto rrDto, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        rSer.cancelReservationByRRId(rrDto.getRr_id());

        List<RentalReservationDto> rrList = rDao.getReservationListByCId(c_id);

        return rrList;
    }


    @GetMapping("/favoritestores")   // 즐겨찾는서점
    public String mypageFavoriteStores(@RequestParam(defaultValue = "1") int page, Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        log.info("page:{}", page);

        int numOfStores = mDao.countFavStores(c_id);
        int storesPerPage = 4;
        int numOfPages = (int) Math.ceil((double) numOfStores / storesPerPage);
        int start = (page - 1) * storesPerPage + 1;
        int end = start + storesPerPage - 1;

        List<MemberDto> favStores = mDao.getFavStoreList(c_id, start, end);

        log.info("favStores:{}", favStores);

        model.addAttribute("currentPage", page);
        model.addAttribute("numOfPages", numOfPages);
        model.addAttribute("favStores", favStores);

        return "customer/mypageFavoriteStores";
    }

    @GetMapping("/favoritebooks")    // 찜한도서
    public String mypageFavoriteBooks(@RequestParam(defaultValue = "1") int page, Model model, HttpSession session) {

        //일단 하드코딩함.
        String c_id = "customer001";
        //회원가입, 로그인 기능 생기면 윗줄 수정하기.

        log.info("page:{}", page);

        int numOfBooks = mDao.countFavBooks(c_id);
        int booksPerPage = 8;
        int numOfPages = (int) Math.ceil((double) numOfBooks / booksPerPage);
        int start = (page - 1) * booksPerPage + 1;
        int end = start + booksPerPage - 1;

        List<BookDto> favBooks = mDao.getFavBookList(c_id, start, end);

        log.info("favBooks:{}", favBooks);

        model.addAttribute("currentPage", page);
        model.addAttribute("numOfPages", numOfPages);
        model.addAttribute("favBooks", favBooks);

        return "/customer/mypageFavoriteBooks";
    }

}