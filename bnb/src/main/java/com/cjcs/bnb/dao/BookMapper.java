package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.BookDto;

@Mapper
public interface BookMapper {
    List<BookDto> findAll();

    List<BookDto> bookAllList(@Param("start") int start, @Param("end") int end);

    int countTotalBooks();

    BookDto findByIsbn(String bIsbn);

    BookDto findBookByIsbnAndSellerId(@Param("isbn") String isbn, @Param("sellerId") String sellerId);

    List<BookDto> findByKwPg(@Param("keyword") String keyword, @Param("start") int start, @Param("end") int end);

    int countKeyword(String keyword);

    // 중분류 카테고리 조회
    List<BookDto> findBooksByMediumCategory(@Param("category_m_id") String category_m_id, @Param("start") int start,
            @Param("end") int end);
    int countBooksByMediumCategory(String category_m_id);
    // 소분류 카테고리 조회
    List<BookDto> findBooksBySmallCategory(String category_s_id, int start, int end);
    int countBooksBySmallCategory(String category_s_id);

    //책 상세 페이지 조회
    BookDto bookDetail(@Param("isbn") String isbn, @Param("sellerId") String sellerId);

    // ISBN 조회
    List<BookDto> findBooksByIsbn(@Param("isbn") String isbn);



    //예림

    //판매자 페이지 - 등록한 도서 리스트 조회
    public List<BookDto> searchSellerBookList(String s_id);

    //판매자 페이지 - 등록된 도서 검색
    public List<BookDto> searchSellerBookList(@Param("s_id") String s_id, @Param("filter") String filter, @Param("keyword") String keyword);



    //수희

    public int updateSaleStock(String s_id, String b_isbn, int qty);
    public int updateRentalStock(String s_id, String b_isbn, int qty);
    public HashMap<String, Object> getStockInfo(Integer cart_id);

}
