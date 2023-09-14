package com.cjcs.bnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {

    @RequestMapping("/books")
    public String books() {
        return "/books/books";
    }

    //제보하기 
    @GetMapping("/report")
    public String report() {
        return "report";
    }

}