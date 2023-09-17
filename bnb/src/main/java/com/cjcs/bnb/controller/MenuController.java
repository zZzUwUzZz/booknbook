package com.cjcs.bnb.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;

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

    @GetMapping("/report_form")
    public String report() {
        return "/report";  // 제보 폼을 보여주는 페이지로 리다이렉트
    }

    @PostMapping("/report")
    public String report(@ModelAttribute ReportBoardDto reportBoardDto) {
        reportBoardDto.setReport_date(Timestamp.valueOf(LocalDateTime.now()));  // 현재 시간 설정
        boardService.insertReport(reportBoardDto);  // DTO 객체를 서비스 레이어에 전달하여 데이터베이스에 저장
        return "redirect:/admin";  // 제보가 성공적으로 생성된 후 /admin으로 리다이렉트
    }

}