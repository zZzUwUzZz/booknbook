package com.cjcs.bnb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;
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


  // 이미지 정보를 불러와서 별도의 List에 추가
  List<SellerFileDto> imageInfos = new ArrayList<>();
  for (SellerDto seller : results) {
      List<SellerFileDto> images = searchService.getImagesBySellerId(seller.getS_id());
      if (images != null && !images.isEmpty()) {
          imageInfos.addAll(images); // 이미지 정보를 리스트에 추가
      }
  }

        model.addAttribute("keyword", keyword);
        model.addAttribute("results", results);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("imageInfos", imageInfos);  // 이미지 정보를 추가
 
        System.out.println("검색한 키워드: " + keyword);
        System.out.println("검색 정보: " + results);
        System.out.println("검색 수: " + totalItems);
        System.out.println("이미지 주소: " + imageInfos);


        return "/map/map";
    }


 


}
