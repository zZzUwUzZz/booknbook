package com.cjcs.bnb.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.MemberDto;

@Mapper
public interface MainMapper {
    List<MemberDto> getMainInfos();
}