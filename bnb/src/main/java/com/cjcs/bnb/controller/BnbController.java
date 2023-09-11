package com.cjcs.bnb.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjcs.bnb.dao.CategoryDao;
import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dao.ReportBoardDao;
import com.cjcs.bnb.dto.BookDto;
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
    @Autowired
    private CategoryDao categoryDao;


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

        HashMap<String, List<HashMap<String, String>>> categoryNames = new HashMap<>();

        List<BookDto> categoryNamesM = categoryDao.listMediumCategories();

        for (BookDto categoryNameM : categoryNamesM) {

            String nameM = categoryNameM.getCategory_m();
            List<HashMap<String, String>> NamesS = categoryDao.listSmallCategoryNames(categoryNameM.getCategory_m_id());

            categoryNames.put(nameM, NamesS);
        }

        model.addAttribute("categoryNames", categoryNames);

        int num_of_seller = mDao.countSellers(null);
        int num_of_customer = mDao.countCustomers(null);

        model.addAttribute("num_of_seller", num_of_seller);
        model.addAttribute("num_of_customer", num_of_customer);

        return "admin/admin";
    }

    @GetMapping("/admin/categoryadd")    // 카테고리(중/소) 추가
    public String addCategory(@RequestParam HashMap<String, String> category) {

        String category_m_id = category.get("category_m_id");

        if (category_m_id == null) {

            category_m_id = categoryDao.getMediumCategoryIdByName(category.get("category_m"));
            categoryDao.addSmallCategory(category_m_id, category.get("category_s_id"), category.get("category_s"));

        } else {

            categoryDao.addMediumCategory(category_m_id, category.get("category_m"));
        }

        return "redirect:/admin";
    }

    @GetMapping("/admin/categorymdelete/{category_m}")    // 카테고리(중) 삭제
    public String deleteCategoryM(@PathVariable String category_m) {

        String category_m_id = categoryDao.getMediumCategoryIdByName(category_m);
        categoryDao.deleteMediumCategory(category_m_id);

        return "redirect:/admin";
    }

    @GetMapping("/admin/categorysdelete/{category_s_id}")    // 카테고리(소) 삭제
    public String deleteCategoryS(@PathVariable String category_s_id) {

        log.info("s_id:{}", category_s_id);
        categoryDao.deleteSmallCategory(category_s_id);

        return "redirect:/admin";
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
