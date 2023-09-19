package com.cjcs.bnb.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;

@Mapper
public interface BookstoreMapper {
    List<MemberDto> getAllImageList(); // List로 반환

    List<BookDto> booksBySeller(int start, int end, String sellerId);

    int countBooksBySeller(String sellerId);

    SellerDto getSellerById(String sellerId);

    // 서점 상세 페이지
    List<BookDto> getBooksBySeller(@Param("sellerId") String sellerId, @Param("start") int start,
            @Param("end") int end);

    int countTotalBooksBySeller(@Param("sellerId") String sellerId);

    SellerFileDto getSellerFileById(@Param("sellerId") String sellerId);

}
