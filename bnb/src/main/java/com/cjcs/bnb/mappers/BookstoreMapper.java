package com.cjcs.bnb.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.MemberDto;

@Mapper
public interface BookstoreMapper {
    List<MemberDto> getAllImageList(); // List로 반환
}
