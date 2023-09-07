package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.ReportBoardDto;
import com.cjcs.bnb.dto.SearchDto;

@Mapper
public interface ReportBoardDao {
    
    public List<ReportBoardDto> getReportList();
    public List<ReportBoardDto> getReportListByKeyword(SearchDto sDto);
    
    public Integer countReports(SearchDto sDto);

}
