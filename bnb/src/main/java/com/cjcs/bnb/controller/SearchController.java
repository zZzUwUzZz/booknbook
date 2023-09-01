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
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.SearchService;


@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    @Autowired
    private BookService bookService;

    
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchBooks(@RequestParam("keyword") String keyword, @RequestParam(defaultValue = "1") int page, Model model) {
        
        int booksPerPage = 15;
        int start = (page - 1) * booksPerPage + 1;
        int end = start + booksPerPage - 1;
        List<BookDto> books = searchService.findByKwPg(keyword, start, end);

        if (keyword != null && !keyword.isEmpty()) {
            // 키워드가 있는 경우
            books = searchService.findByKwPg(keyword, start, end);
            model.addAttribute("keyword", keyword);
        } else {
            // 키워드가 없는 경우 (여기서는 키워드가 없으면 에러 페이지나 메시지를 보여줍니다.)
            return "errorPage";
        }

        int totalItems = searchService.countKeyword(keyword);
        int totalPages = (int) Math.ceil((double) totalItems / booksPerPage);

        model.addAttribute("books", books);
        model.addAttribute("keyword", keyword);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems", totalItems);

        return "/search/search";
    }
}



// @Controller
// public class SearchController {

//     @Autowired
//     private SearchService searchService;

//     @Autowired
//     private BookService bookService;

//     @RequestMapping(value = "/search", method = RequestMethod.GET)
//     public String searchBooks(@RequestParam("keyword") String keyword, @RequestParam(defaultValue = "1") int page, Model model) {
//         List<BookDto> books = searchService.searchBooksByKeyword(keyword, start, end);
//         model.addAttribute("books", books);
//         model.addAttribute("keyword", keyword);
//         return "    /search/search";
//     }

//     @RequestMapping(value = "/search", method = RequestMethod.GET, params = "!keyword")
//     public String listBooks(Model model, @RequestParam(defaultValue = "1") int page) {
//         int booksPerPage = 15; // 페이지 당 책 개수
//          int start = (page - 1) * booksPerPage + 1; // 페이지가 1일 때 start는 1, 페이지가 2일 때 start는 16
//         int end = start + booksPerPage - 1; // 페이지가 1일 때 end는 15, 페이지가 2일 때 end는 30
//         List<BookDto> books = searchService.searchBooksByKeyword(keyword, start, end);

//         int totalItems = bookService.countTotalBooks(); // 이 메서드는 BookService에서 구현해야 합니다.
//         System.out.println("Total items: " + totalItems); // 로그 출력

//         int totalPages = (int) Math.ceil((double) totalItems / booksPerPage);
//         System.out.println("Total pages: " + totalPages); // 로그 출력

//         model.addAttribute("books", books); // 모델에 책 데이터 추가
//         model.addAttribute("currentPage", page); // 현재 페이지 정보 추가
//         model.addAttribute("totalPages", totalPages); // 총 페이지 수 추가
//         model.addAttribute("totalItems", totalItems); // 총 아이템 수 추가 (선택적)
//         return "/search/search";
//     }
// }
