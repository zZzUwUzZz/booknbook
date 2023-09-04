package com.cjcs.bnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {

    @RequestMapping("/books")
    public String books() {
        return "/books/books";
    }

    @RequestMapping("/bookstore")
    public String bookstore() {
        return "/bookstore/bookstore";
    }

}