package com.cjcs.bnb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.FavDto;
import com.cjcs.bnb.dto.SellerFileDto;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.FavoriteService;
import com.cjcs.bnb.service.SearchService;

@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    @Autowired
    private BookService bookService;

      @Autowired
    private FavoriteService favoriteService;


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

    // 지도에서 서점 검색

    @RequestMapping(value = "/map", method = RequestMethod.GET, params = "keyword")
    public String search(
            @RequestParam String keyword,
            @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
            Model model) {

                int pageSize = 5;  
                int startIdx = (pageNum - 1) * pageSize;
            
                List<SellerDto> results = searchService.searchBookstores(keyword, startIdx, pageSize);
                int totalItems = searchService.countBookstores(keyword);
                int totalPages = (int) Math.ceil((double) totalItems / pageSize); // 총 페이지 수 계산
            
        // 이미지 정보를 불러와서 별도의 List에 추가
        List<SellerFileDto> imageInfos = new ArrayList<>();
        for (SellerDto seller : results) {
            List<SellerFileDto> images = searchService.getImagesBySellerId(seller.getS_id());
            if (images != null && !images.isEmpty()) {
                imageInfos.addAll(images); // 이미지 정보를 리스트에 추가
            }
        }

        // 이미지 정보와 함께 회원 정보도 불러와서 별도의 List에 추가
        List<MemberDto> memberInfos = new ArrayList<>();
        for (SellerDto seller : results) {
            MemberDto member = searchService.getMemberInfo(seller.getS_id());
            if (member != null) {
                memberInfos.add(member); // 회원 정보를 리스트에 추가
            }
        }

        // 위도와 경도 정보도 추가 (이 가정에서는 SellerDto가 s_latitude와 s_longitude를 가진다)
        List<Double> latitudes = results.stream().map(SellerDto::getS_latitude).collect(Collectors.toList());
        List<Double> longitudes = results.stream().map(SellerDto::getS_longitude).collect(Collectors.toList());

        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPages", totalPages); 
        model.addAttribute("latitudes", latitudes);
        model.addAttribute("longitudes", longitudes);

        model.addAttribute("keyword", keyword);
        model.addAttribute("results", results);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("imageInfos", imageInfos);
        model.addAttribute("memberInfos", memberInfos);

        return "/map/map";
    }

    
    @RequestMapping(value = "/get_store_details", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> getStoreDetails(@RequestParam(name = "id") String storeId) {
        MemberDto seller = searchService.getMemberInfo(storeId);
        System.out.println("Seller Info: " + seller);

        if (seller == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        Map<String, Object> response = new HashMap<>();
        response.put("store_img", seller.getSf_sysname());
        response.put("store_name", seller.getS_storename());
        response.put("store_addr", seller.getM_addr());
        response.put("store_phone", seller.getM_phone());
        response.put("store_description", seller.getS_storedesc());
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

 
}
