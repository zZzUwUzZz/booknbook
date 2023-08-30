package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dto.BookDto;

@Service
public class BookService {
    @Autowired
    private BookMapper bookMapper;

    public List<BookDto> findAll() {
        return bookMapper.findAll();
    }
}