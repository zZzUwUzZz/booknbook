package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String report(@ModelAttribute ReportBoardDto reportBoardDto, RedirectAttributes redirectAttributes) {
    boardService.insertReport(reportBoardDto);
    // redirectAttributes.addFlashAttribute("message", "성공적으로 글이 올라갔습니다.");
    return "redirect:/"; 
}

}