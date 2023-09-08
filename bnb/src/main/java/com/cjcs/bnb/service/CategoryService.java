package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.CategoryDao;
import com.cjcs.bnb.dto.BookDto;

@Service
public class CategoryService {
    @Autowired
    private CategoryDao categoryDao;

    public List<BookDto> listMediumCategories() {
        return categoryDao.listMediumCategories();
    }

    public List<BookDto> listSmallCategories(String mediumCategoryId) {
        return categoryDao.listSmallCategories(mediumCategoryId);
    }

    public List<BookDto> listAllSmallCategories() {
        return categoryDao.listAllSmallCategories(); 
    }
}
