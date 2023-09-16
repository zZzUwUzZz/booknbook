package com.cjcs.bnb.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjcs.bnb.dto.ReportBoardDto;
import com.cjcs.bnb.service.BoardService;

@Controller
public class MenuController {

 @Autowired
    private BoardService boardService;


    @RequestMapping("/books")
    public String books() {
        return "/books/books";
    }

    @PostMapping("/report/save")
    public String saveReport(@ModelAttribute ReportBoardDto reportBoardDto) {
        reportBoardDto.setReport_date(new Timestamp(System.currentTimeMillis()));
        boardService.saveReport(reportBoardDto);
        return "redirect:admin/report";  // 수정된 부분
    }
   
    
}