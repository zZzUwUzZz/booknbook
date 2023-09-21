package com.cjcs.bnb.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;
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

    // 서점 상세 페이지
    public List<BookDto> getBooksBySeller(String sellerId, int start, int end) {
        return bookstoreMapper.getBooksBySeller(sellerId, start, end);
    }

    public int countTotalBooksBySeller(String sellerId) {
        return bookstoreMapper.countTotalBooksBySeller(sellerId);
    }

    public SellerDto getSellerById(String sellerId) {
        return bookstoreMapper.getSellerById(sellerId);
    }

    public SellerFileDto getSellerFileById(String sellerId) {
        return bookstoreMapper.getSellerFileById(sellerId);
    }

}