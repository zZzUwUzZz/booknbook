package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dao.ReportBoardDao;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.ReportBoardDto;
import com.cjcs.bnb.dto.SearchDto;
import com.cjcs.bnb.service.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BnbController {

    @Autowired
    private BoardService bSer;

    @Autowired
    private MemberDao mDao;
    @Autowired
    private ReportBoardDao rbDao;


    // 메인
    @GetMapping("/")
    public String main() {
        return "main";
    }

    // 지도
    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String map() {
        return "/map/map";
    }




    // 여기부터 관리자페이지

    @GetMapping("/admin")    // 관리자페이지 홈
    public String admin(Model model) {


        return "admin/admin";
    }

    @GetMapping("/admin/customerlist")    // 일반회원리스트
    public String adminCustomerList(SearchDto sDto, Model model, HttpSession session) {

        List<MemberDto> customerList = mDao.getCustomerListByKeyword(sDto);
        
        log.info("customerList:{}", customerList.size());

		String pageHtml = bSer.getPageboxHtml(sDto, "/admin/customerlist");

		if (customerList != null) {

			session.setAttribute("pageNum", sDto.getPageNum());

			if(sDto.getColname() != null) {
				session.setAttribute("sDto", sDto);
			}else {
				session.removeAttribute("sDto");
			}

			model.addAttribute("customerList", customerList);
			model.addAttribute("pageHtml", pageHtml);

		}

        return "admin/adminCustomerList";
    }

    @GetMapping("/admin/sellerlist")    // 서점회원리스트
    public String adminSellerList(SearchDto sDto, Model model, HttpSession session) {

        List<MemberDto> sellerList = mDao.getSellerListByKeyword(sDto);
        log.info("sellerList:{}", sellerList.size());

		String pageHtml = bSer.getPageboxHtml(sDto, "/admin/sellerlist");

		if (sellerList != null) {

			session.setAttribute("pageNum", sDto.getPageNum());

			if(sDto.getColname() != null) {
				session.setAttribute("sDto", sDto);
			}else {
				session.removeAttribute("sDto");
			}

			model.addAttribute("sellerList", sellerList);
			model.addAttribute("pageHtml", pageHtml);
		}

        return "admin/adminSellerList";
    }

    @GetMapping("/admin/reportlist")    // 제보글리스트
    public String adminReportList(SearchDto sDto, Model model, HttpSession session) {

        List<ReportBoardDto> reportList = rbDao.getReportListByKeyword(sDto);
		log.info("reportList:{}", reportList.size());

		String pageHtml = bSer.getPageboxHtml(sDto, "/admin/reportlist");

		if (reportList != null) {

			session.setAttribute("pageNum", sDto.getPageNum());

			if(sDto.getColname() != null) {
				session.setAttribute("sDto", sDto);
			}else {
				session.removeAttribute("sDto");
			}

			model.addAttribute("reportList", reportList);
			model.addAttribute("pageHtml", pageHtml);
		}

        return "admin/adminReportList";
    }

    @GetMapping("/admin/reportdetail/{report_id}")    // 제보글상세보기
    public String adminReportDetail(@PathVariable("report_id") int report_id, Model model) {

        ReportBoardDto rbDto = rbDao.getReportByRId(report_id);
        log.info("rbDto:{}", rbDto);

        model.addAttribute("rbDto", rbDto);

        return "admin/adminReportDetail";
    }

    @GetMapping("admin/reportdelete/{report_id}")    // 제보글삭제
    public String adminReportDelete(@PathVariable("report_id") int report_id, Model model) {

        rbDao.deleteReportByRId(report_id);
        
        return "redirect:/admin/reportlist";
    }
    
}
