package com.cjcs.bnb.dao;

import java.util.List;
import java.util.Map;

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

    //예림

    //판매자 페이지 - 등록한 도서 리스트 조회
    public List<BookDto> searchSellerBookList(String s_id);

    //판매자 페이지 - 등록된 도서 검색
    public List<BookDto> searchSellerBookList(@Param("s_id") String s_id, @Param("filter") String filter, @Param("keyword") String keyword);

    

}
