package com.cjcs.bnb.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @GetMapping("/report")
    public String report() {
        return "/report/report";
    }

    @PostMapping("/report")
    public String report(@ModelAttribute ReportBoardDto reportBoardDto) {
        boardService.insertReport(reportBoardDto);
        return "redirect:/"; 
    }

}