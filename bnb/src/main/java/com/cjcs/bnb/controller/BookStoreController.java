package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.service.BookstoreService;

@Controller
public class BookStoreController {

    @Autowired
    private BookstoreService bookstoreService;

    @GetMapping("/bookstore")
    public String bookstore(Model model) {
        List<MemberDto> allImageList = bookstoreService.getAllImageList();
        model.addAttribute("allImageList", allImageList);
        return "/bookstore/bookstore";
    }
}
