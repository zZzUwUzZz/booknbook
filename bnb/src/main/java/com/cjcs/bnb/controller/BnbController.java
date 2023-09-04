package com.cjcs.bnb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

 
@Controller
public class BnbController {

    // 메인
    @GetMapping("/")
    public String main() {
        return "main";
    }
 
    
    // 검색
    @GetMapping("/search")
    public String search(@RequestParam String keyword, Model model) {
        model.addAttribute("keyword", keyword);
        List<String> allItems = new ArrayList<>();
    allItems.add("apple");
    allItems.add("banana");
    allItems.add("cherry");
        
        // 검색 로직 (예: 데이터베이스 조회)

        // 결과를 result라는 변수에 저장    
        List<String> result = allItems.stream()
                                  .filter(item -> item.contains(keyword))
                                  .collect(Collectors.toList());
        // 검색 결과를 JSP에 전달
        model.addAttribute("result", result);
        return "/search/search"; 
    }

    // 지도 
    @GetMapping("/map")
    public String map() {
        return "/map/map";
    }

}
