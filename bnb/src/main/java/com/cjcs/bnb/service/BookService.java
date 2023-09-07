package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.BookDao;
import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dto.BookDto;

@Service
public class BookService {

    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private static BookDao bDao;

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

    // 중분류 카테고리 조회
    public List<BookDto> findBooksByMediumCategory(String category_m_id, int start, int limit) {
        return bookMapper.findBooksByMediumCategory(category_m_id, start, limit);
    }

    public int countBooksByMediumCategory(String category_m_id) {
        return bookMapper.countBooksByMediumCategory(category_m_id);
    }

    // public static List<BookDto> getSellerBookList(String b_s_id){
    // return bDao.getSellerBookList(b_s_id);
    // }
}