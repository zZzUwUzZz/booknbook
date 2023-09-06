package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.ReportBoardDto;

@Mapper
public interface ReportBoardDao {
    
    public List<ReportBoardDto> getReportList();

}
