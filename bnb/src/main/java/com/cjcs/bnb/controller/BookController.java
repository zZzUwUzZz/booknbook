package com.cjcs.bnb.controller;


import java.util.ArrayList;
import java.util.List;

public class BookController {
    private String categoryTitle;
    private String bookCover;
    private String bookTitle;
    private int price;
    private String author;
    private int quantity;
    private List<String> cartAdd = new ArrayList<>();
    private List<String> likeBook = new ArrayList<>();
    private boolean isOutOfStock = false;

    // 수량 조정 - 감소
    public void adjustQuantity() {
        if (quantity > 0) {
            quantity--;
        }
    }
    
    // 수량 - 증가
    public void manageQuantity() {
        quantity++;
    }

    public int calculateTotalPrice() {
        return price * quantity;
    }

    // 대여 - 장바구니 
    public void rentAdd() {
        cartAdd.add(bookTitle);
        // Display rental added notification
        System.out.println("cartAdd: " + bookTitle);
        // Navigate to rent.jsp
        // navigateToRentPage();
    }

    // Add to cart
    public void cartAdd() {
        if (isOutOfStock) {
            cartAdd.add(bookTitle);
            // Display added to cart notification
            System.out.println("Added to cart: " + bookTitle);
            // Navigate to cart.jsp
            // navigateToCartPage();
        } else {
            // Display out of stock notification
            System.out.println("Book is out of stock.");
            // Activate notification button
            // activateNotificationButton();
        }
    }
    // 책소개
    public String bookIntroduction() {
        return "This book is...";
    }

    // 찜 버튼
    public void likeBook() {
        likeBook.add(bookTitle);
        // Display liked book notification
        System.out.println("Likebook: " + bookTitle);
    }

    public String getCategoryTitle() {
        return categoryTitle;
     }
 
}

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.service.BookService;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping("/books")
    public String listBooks(Model model, @RequestParam(defaultValue = "1") int page) {
        int booksPerPage = 15; // 페이지 당 책 개수
        int start = (page - 1) * booksPerPage + 1; // 페이지가 1일 때 start는 1, 페이지가 2일 때 start는 16
        int end = start + booksPerPage - 1; // 페이지가 1일 때 end는 15, 페이지가 2일 때 end는 30
        List<BookDto> books = bookService.bookAllList(start, end);

        int totalItems = bookService.countTotalBooks(); // 이 메서드는 BookService에서 구현해야 합니다.
        System.out.println("Total items: " + totalItems); // 로그 출력

        int totalPages = (int) Math.ceil((double) totalItems / booksPerPage);
        System.out.println("Total pages: " + totalPages); // 로그 출력

        model.addAttribute("books", books); // 모델에 책 데이터 추가
        model.addAttribute("currentPage", page); // 현재 페이지 정보 추가
        model.addAttribute("totalPages", totalPages); // 총 페이지 수 추가
        model.addAttribute("totalItems", totalItems); // 총 아이템 수 추가 (선택적)
        return "/books/books";
    }


    @GetMapping("/books/detail/{isbn}/{sellerId}")
    public String bookDetail(@PathVariable String isbn, @PathVariable String sellerId, Model model) {
        // 여기서 isbn과 sellerId를 사용해 DB에서 해당 책의 상세 정보를 가져옵니다.
        BookDto book = bookService.findBookByIsbnAndSellerId(isbn, sellerId);
        model.addAttribute("book", book);
        return "/books/detail";
    }

}
}

