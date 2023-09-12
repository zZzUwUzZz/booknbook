package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.CartDto;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.MemberService;
import com.cjcs.bnb.service.NotificationService;
import com.cjcs.bnb.service.OrderService;

import jakarta.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// 이 컨트롤러에서 책상세페이지, 서점상세페이지 url-메서드 매핑하셈

@Controller
public class DetailPageController {

    @Autowired
    private MemberService mSer; // 책상세에서 찜, 서점상세에서 즐겨찾기 할 때 필요
    @Autowired
    private NotificationService nSer; // 책상세에서 입고알림신청, 대여예약 할 때 필요
    @Autowired
    private BookService bSer;
    @Autowired
    private OrderService oSer;

    @GetMapping("/books/detail/{isbn}/{sellerId}")
    public String bookDetail(@PathVariable String isbn, @PathVariable String sellerId, Model model) {
        // 여기서 isbn과 sellerId를 사용해 DB에서 해당 책의 상세 정보를 가져옵니다.
        BookDto book = bSer.findBookByIsbnAndSellerId(isbn, sellerId);
        BookDto bdInfo = bSer.bookDetail(isbn, sellerId);
        List<BookDto> bkISBN = bSer.findBooksByIsbn(isbn);

        model.addAttribute("bkISBN", bkISBN);
        model.addAttribute("book", book);
        model.addAttribute("bdInfo", bdInfo);
        model.addAttribute("sellerId", sellerId);
        model.addAttribute("isbn", isbn);

        return "/books/detail";
    }

    private static final Logger logger = LoggerFactory.getLogger(DetailPageController.class);

    @PostMapping("/addtocart")
    public ResponseEntity<String> addToCart(@RequestBody CartDto cartDto) {
        String c_id = "customer001"; // 로그인 정보에서 가져올 것
        cartDto.setCart_c_id(c_id);
        cartDto.setCart_sort("구매"); // 구매 목록이라고 명시

        // 구매 목록에 대한 처리
        CartDto existingCartItem = oSer.findPurCartItem(cartDto);
        if (existingCartItem != null) {

            if (existingCartItem.getCart_amount() + cartDto.getCart_amount() > 9) {
                return new ResponseEntity<>("over", HttpStatus.OK);
            }
            cartDto.setCart_amount(cartDto.getCart_amount() + existingCartItem.getCart_amount());
            oSer.updateCartItem(cartDto);
            return new ResponseEntity<>("updated", HttpStatus.OK);
        } else {
            oSer.addToCart(cartDto);
            return new ResponseEntity<>("구매 목록에 추가되었습니다.", HttpStatus.OK);
        }

    }

    @PostMapping("/addtocartrent")
    public ResponseEntity<String> addToCartRent(@RequestBody CartDto cartDto) {
        String c_id = "customer001"; // 로그인 정보에서 가져올 것
        cartDto.setCart_c_id(c_id);
        cartDto.setCart_sort("대여"); // 대여 목록이라고 명시

        boolean isAdded = oSer.addToCartRent(cartDto);

        if (isAdded) {
            return new ResponseEntity<>("added", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("already_exists", HttpStatus.OK);
        }
    }

}