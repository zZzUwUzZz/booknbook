package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.BookDto;

@Mapper
public interface BookMapper {
    List<BookDto> findAll();

    List<BookDto> bookAllList(@Param("start") int start, @Param("end") int end);

    int countTotalBooks();

}
