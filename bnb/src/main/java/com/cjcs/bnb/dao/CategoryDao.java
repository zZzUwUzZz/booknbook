package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.BookDto;

@Mapper
public interface CategoryDao {

    List<BookDto> listMediumCategories();
    List<BookDto> listSmallCategories(String mediumCategoryId);
    List<BookDto> listAllSmallCategories();

    //수희
    List<HashMap<String, String>> listSmallCategoryNames(String category_m_id);
    String getMediumCategoryIdByName(String category_m);
    String getSmallCategoryIdByName(String category_s);
    Boolean addMediumCategory(String category_m_id, String category_m);
    Boolean addSmallCategory(String category_m_id, String category_s_id, String category_s);
    Boolean deleteMediumCategory(String category_m_id);
    Boolean deleteSmallCategory(String category_s_id);
    
}
