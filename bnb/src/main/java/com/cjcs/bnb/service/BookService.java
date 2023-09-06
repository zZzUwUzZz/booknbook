package com.cjcs.bnb.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.BookDao;
import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dto.BookDto;

@Service
public class BookService {
    @Autowired
    private BookMapper bookMapper;

    public List<BookDto> findAll() {
        return bookMapper.findAll();
    }

    public List<BookDto> bookAllList(int start, int limit) {
        return bookMapper.bookAllList(start, limit);
    }

    public int countTotalBooks() {
        return bookMapper.countTotalBooks();
    }

    public BookDto findByIsbn(String B_ISBN) {
        return bookMapper.findByIsbn(B_ISBN);
    }

    public BookDto findBookByIsbnAndSellerId(String isbn, String sellerId) {
        return bookMapper.findBookByIsbnAndSellerId(isbn, sellerId);
    }

    // 판매자 페이지 - 등록한 도서 전체 리스트 조회
    public List<BookDto> getSellerBookList(String s_id) {
        return bookMapper.searchSellerBookList(s_id);
    }

    // 판매자 페이지 - 등록된 도서 검색
    public List<BookDto> searchSellerBookList(String s_id, String filter, String keyword) {
        return bookMapper.searchSellerBookList(s_id, filter, keyword);
    }
}