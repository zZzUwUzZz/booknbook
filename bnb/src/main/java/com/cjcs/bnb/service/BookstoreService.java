package com.cjcs.bnb.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.mappers.BookstoreMapper;

@Service
public class BookstoreService {
    @Autowired
    private BookstoreMapper bookstoreMapper;

    public List<MemberDto> getAllImageList() { // List로 반환
        return bookstoreMapper.getAllImageList();
    }

    public List<BookDto> booksBySeller(int start, int end, String sellerId) {
        return bookstoreMapper.booksBySeller(start, end, sellerId);
    }

    public int countBooksBySeller(String sellerId) {
        return bookstoreMapper.countBooksBySeller(sellerId);
    }
}
