package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dto.BookDto;

@Service
public class SearchService {

    @Autowired
    private BookMapper bookMapper;
 
    public List<BookDto> findByKwPg(String keyword, int start, int end) {
        return bookMapper.findByKwPg(keyword, start, end);
    }
 
    public int countKeyword(String keyword) {
        return bookMapper.countKeyword(keyword);
    }

    
}
