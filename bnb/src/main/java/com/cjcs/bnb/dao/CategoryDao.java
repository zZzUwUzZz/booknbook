package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.BookDto;

@Mapper
public interface CategoryDao {
    List<BookDto> listMediumCategories();
    List<BookDto> listSmallCategories(String mediumCategoryId);
    List<BookDto> listAllSmallCategories();  
}
