package com.cjcs.bnb.controller;

import java.util.Calendar;
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
import com.fasterxml.jackson.core.JsonProcessingException;

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

    @GetMapping("/admin")
    public String admin(Model model) {

        return "admin/admin";
    }

    @GetMapping("/admin/customerlist")
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

    @GetMapping("/admin/sellerlist")
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

    @GetMapping("/admin/reportlist")
    public String adminReportList(SearchDto sDto, Model model, HttpSession session) {

        List<ReportBoardDto> reportList = rbDao.getReportListByKeyword(sDto);
		log.info("reportList:{}", reportList.size());

		String pageHtml = bSer.getPageboxHtml(sDto, "/admin/reportlist");

		if (reportList != null) {
			//세션에 필요 정보 저장(pageNum, 검색관련 정보)
		    //페이지 번호 저장- 글쓰기 또는 상세보기 화면에서
			//목록으로 돌아갈 때 보고 있던 페이지로 돌아가기 위해
			session.setAttribute("pageNum", sDto.getPageNum());

			if(sDto.getColname() != null) {
				session.setAttribute("sDto", sDto);  //페이지번호,컬럼이름,키워드
			}else {
				//검색이 아닐때는 SearchDto 제거
				session.removeAttribute("sDto");
			} //session

			model.addAttribute("reportList", reportList); // 3, jstl(쉽다,협업X)
			model.addAttribute("pageHtml", pageHtml);
			// model.addAttribute("bList", makeHtml(bList)); //1 서버
			// model.addAttribute("bList",
			// new ObjectMapper().writeValueAsString(bList)); //2,js(어렵다, 협업O)
		}

        return "admin/adminReportList";
    }

    @GetMapping("/admin/reportdetail/{report_id}")
    public String adminReportDetail(@PathVariable("report_id") int report_id, Model model) {

        return "admin/adminReportDetail";
    }
    
}
