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

@Controller
public class BnbController {

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
    public String adminCustomerList(Model model) {

        List<MemberDto> customerList = mDao.getAllCustomerInfo();
        model.addAttribute("customerList", customerList);

        return "admin/adminCustomerList";
    }

    @GetMapping("/admin/sellerlist")
    public String adminSellerList(Model model) {

        List<MemberDto> sellerList = mDao.getAllSellerInfo();
        model.addAttribute("sellerList", sellerList);

        return "admin/adminSellerList";
    }

    @GetMapping("/admin/reportlist")
    public String adminReportList(Model model) {

        List<ReportBoardDto> reportList = rbDao.getReportList();
        model.addAttribute("reportList", reportList);

        return "admin/adminReportList";
    }

    @GetMapping("/admin/reportdetail/{report_id}")
    public String adminReportDetail(@PathVariable("report_id") int report_id, Model model) {

        return "admin/adminReportDetail";
    }

}
