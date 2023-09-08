package com.cjcs.bnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cjcs.bnb.dao.CategoryDao;
import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.service.CategoryService;

@RestController
public class CategoryApiController {
    @Autowired
    private CategoryService categoryService;

    @GetMapping("/api/mediumCategories")
    public List<BookDto> listMediumCategories() {
        return categoryService.listMediumCategories();
    }

    @GetMapping("/api/smallCategories")
    public List<BookDto> listSmallCategories(@RequestParam String mediumCategoryId) {
        return categoryService.listSmallCategories(mediumCategoryId);
    }
}
