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

    // public static List<BookDto> getSellerBookList(String b_s_id){
    //     return bDao.getSellerBookList(b_s_id);
    // }
}