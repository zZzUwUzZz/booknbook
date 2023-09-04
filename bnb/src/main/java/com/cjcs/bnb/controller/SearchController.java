package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.SearchService;

@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchBooks(@RequestParam("keyword") String keyword, @RequestParam(defaultValue = "1") int page,
            Model model) {

        int booksPerPage = 15;
        int start = (page - 1) * booksPerPage + 1;
        int end = start + booksPerPage - 1;
        List<BookDto> books = searchService.findByKwPg(keyword, start, end);

        int totalItems = searchService.countKeyword(keyword);
        int totalPages = (int) Math.ceil((double) totalItems / booksPerPage);

        model.addAttribute("books", books);
        model.addAttribute("keyword", keyword);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems", totalItems);

        System.out.println("Total items: " + totalItems);
        System.out.println("Total pages: " + totalPages);

        return "/search/search";
    }

    @RequestMapping(value = "/map", method = RequestMethod.GET, params = "keyword")
    public String search(@RequestParam String keyword, Model model) {
        List<SellerDto> results = searchService.searchBookstores(keyword);
        int totalItems = searchService.countBookstores(keyword);

        model.addAttribute("keyword", keyword);
        model.addAttribute("results", results);
        model.addAttribute("totalItems", totalItems);

        System.out.println("검색한 키워드: " + keyword);
        System.out.println("검색 정보: " + results);
        System.out.println("검색 수: " + totalItems);
        return "/map/map";
    }
}
