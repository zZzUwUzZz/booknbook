package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;
import com.cjcs.bnb.service.BookstoreService;
import com.cjcs.bnb.service.SellerService;

@Controller
public class BookStoreController {

    @Autowired
    private BookstoreService bSer;
    @Autowired
    private SellerService sSer;

    

    @GetMapping("/bookstore")
    public String bookstore(Model model) {
        List<MemberDto> allImageList = bSer.getAllImageList();
        model.addAttribute("allImageList", allImageList);
        return "/bookstore/bookstore";
    }


    // 서점 상세 페이지
    @GetMapping("/bookstore/detail/{sellerId}")
    public String bookstoreDetail(Model model, @PathVariable String sellerId,
            @RequestParam(defaultValue = "1") int page) {
        int booksPerPage = 16;
        int start = (page - 1) * booksPerPage + 1;
        int end = start + booksPerPage - 1;

        List<BookDto> books = bSer.getBooksBySeller(sellerId, start, end);
        int totalItems = bSer.countTotalBooksBySeller(sellerId);

        int totalPages = (int) Math.ceil((double) totalItems / booksPerPage);

        SellerDto seller = bSer.getSellerById(sellerId);
        SellerFileDto sellerFile = bSer.getSellerFileById(sellerId);
        // Your existing logic here

        model.addAttribute("books", books);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("seller", seller);
        model.addAttribute("sellerFile", sellerFile);

        return "/bookstore/bookstoreDetail";
    }
}
