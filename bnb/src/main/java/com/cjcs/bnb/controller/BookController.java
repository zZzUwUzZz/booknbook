package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.CategoryService;

@Controller
public class BookController {
    @Autowired
    private BookService bookService; 

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/books")
    public String listBooks(Model model, @RequestParam(defaultValue = "1") int page) {
        int booksPerPage = 16;
        int start = (page - 1) * booksPerPage + 1;
        int end = start + booksPerPage - 1;
        List<BookDto> books = bookService.bookAllList(start, end);

        int totalItems = bookService.countTotalBooks(); // 이 메서드는 BookService에서 구현해야 합니다.
        System.out.println("Total items: " + totalItems); // 로그 출력

        int totalPages = (int) Math.ceil((double) totalItems / booksPerPage);
        System.out.println("Total pages: " + totalPages); // 로그 출력

        System.out.println("Start: " + start + ", End: " + end);
        System.out.println("Books size: " + books.size());

        List<BookDto> mediumCategories = categoryService.listMediumCategories();
        model.addAttribute("mediumCategories", mediumCategories);
        List<BookDto> smallCategories = categoryService.listAllSmallCategories();
        model.addAttribute("smallCategories", smallCategories);

        model.addAttribute("books", books); // 모델에 책 데이터 추가
        model.addAttribute("currentPage", page); // 현재 페이지 정보 추가
        model.addAttribute("totalPages", totalPages); // 총 페이지 수 추가
        model.addAttribute("totalItems", totalItems); // 총 아이템 수 추가 (선택적)

        return "/books/books";
    }

    @RequestMapping("/books/category/medium/{category_m_id}")
    public String listBooksByCategory(
            @PathVariable String category_m_id,
            @RequestParam(defaultValue = "1") int page,
            Model model) {
        int booksPerPage = 16;
        int start = (page - 1) * booksPerPage + 1;
        int end = start + booksPerPage - 1;

        // 카테고리별 도서 목록을 불러옵니다.
        List<BookDto> books = bookService.findBooksByMediumCategory(category_m_id, start, end);
        model.addAttribute("books", books);

        // 도서 개수도 불러옵니다.
        int totalItems = bookService.countBooksByMediumCategory(category_m_id);
        model.addAttribute("totalItems", totalItems);

        // 전체 페이지 수를 계산합니다.
        int totalPages = (int) Math.ceil((double) totalItems / booksPerPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);

        // 중분류와 소분류 데이터도 다시 불러옵니다.
        List<BookDto> mediumCategories = categoryService.listMediumCategories();
        model.addAttribute("mediumCategories", mediumCategories);
        List<BookDto> smallCategories = categoryService.listAllSmallCategories();
        model.addAttribute("smallCategories", smallCategories);

        // 현재 카테고리를 모델에 추가합니다.
        model.addAttribute("category_m_id", category_m_id);

        System.out.println("카테고리 Total items: " + totalItems);
        System.out.println("카테고리 Total pages: " + totalPages);
        System.out.println("Start: " + start + ", End: " + end);
        System.out.println("Number of books: " + books.size());
        return "/books/books";
    }

    @RequestMapping("/books/category/small/{category_s_id}")
    public String listBooksBySmallCategory(
            @PathVariable String category_s_id,
            @RequestParam(defaultValue = "1") int page,
            Model model) {
        int booksPerPage = 16;
        int start = (page - 1) * booksPerPage + 1;
        int end = start + booksPerPage - 1;

        // 소분류 카테고리별 도서 목록을 불러옵니다.
        List<BookDto> books = bookService.findBooksBySmallCategory(category_s_id, start, end);
        model.addAttribute("books", books);

        // 도서 개수도 불러옵니다.
        int totalItems = bookService.countBooksBySmallCategory(category_s_id);
        model.addAttribute("totalItems", totalItems);

        // 전체 페이지 수를 계산합니다.
        int totalPages = (int) Math.ceil((double) totalItems / booksPerPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);

        // 중분류와 소분류 데이터도 다시 불러옵니다.
        List<BookDto> mediumCategories = categoryService.listMediumCategories();
        model.addAttribute("mediumCategories", mediumCategories);
        List<BookDto> smallCategories = categoryService.listAllSmallCategories();
        model.addAttribute("smallCategories", smallCategories);

        // 현재 카테고리를 모델에 추가합니다.
        model.addAttribute("category_s_id", category_s_id);

        System.out.println("카테고리 Total items: " + totalItems);
        System.out.println("카테고리 Total pages: " + totalPages);
        System.out.println("Start: " + start + ", End: " + end);
        System.out.println("Number of books: " + books.size());

        return "/books/books";
    }

}
