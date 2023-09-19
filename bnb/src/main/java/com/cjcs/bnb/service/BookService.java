package com.cjcs.bnb.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.BookDao;
import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dto.BookDto;

import com.cjcs.bnb.dto.RentalDto;

import com.cjcs.bnb.dto.NotifBoardDto;


@Service
public class BookService {

    @Autowired
    private BookMapper bookMapper;

    public List<BookDto> findAll() {
        return bookMapper.findAll();
    }

    public List<BookDto> bookAllList(int start, int end) {
        return bookMapper.bookAllList(start, end);
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

    public BookDto findBookStock(String isbn, String sellerId) {
        return bookMapper.findBookStock(isbn, sellerId);
    }

    // 중분류 카테고리 조회
    public List<BookDto> findBooksByMediumCategory(String category_m_id, int start, int end) {
        return bookMapper.findBooksByMediumCategory(category_m_id, start, end);
    }

    public int countBooksByMediumCategory(String category_m_id) {
        return bookMapper.countBooksByMediumCategory(category_m_id);
    }

    public List<BookDto> findBooksBySmallCategory(String category_s_id, int start, int end) {
        return bookMapper.findBooksBySmallCategory(category_s_id, start, end);
    }

    public int countBooksBySmallCategory(String category_s_id) {
        return bookMapper.countBooksBySmallCategory(category_s_id);
    }

    // ISBN 조회
    public List<BookDto> findBooksByIsbn(String isbn) {
        return bookMapper.findBooksByIsbn(isbn);
    }

    // public static List<BookDto> getSellerBookList(String b_s_id){
    // return bDao.getSellerBookList(b_s_id);
    // }

    // 판매자 페이지 - 등록한 도서 전체 리스트 조회
    public List<BookDto> getSellerBookList(String s_id) {
        return bookMapper.searchSellerBookList(s_id);
    }

    // 판매자 페이지 - 등록된 도서 검색
    public List<BookDto> searchSellerBookList(String s_id, String filter, String keyword) {
        return bookMapper.searchSellerBookList(s_id, filter, keyword);
    }



    // 책 상세페이지 데이터 조회
    public BookDto bookDetail(String isbn, String sellerId) {
        return bookMapper.bookDetail(isbn, sellerId);
    }
 
}