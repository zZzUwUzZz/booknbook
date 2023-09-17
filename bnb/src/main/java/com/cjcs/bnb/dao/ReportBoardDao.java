package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.ReportBoardDto;
import com.cjcs.bnb.dto.SearchDto;

@Mapper
public interface ReportBoardDao {
    
    public List<ReportBoardDto> getReportList();
    public List<ReportBoardDto> getReportListByKeyword(SearchDto sDto);
    public ReportBoardDto getReportByRId(int report_id);
    
    public Integer countReports(SearchDto sDto);
    
    public void deleteReportByRId(int report_id);

    public void insertReport(ReportBoardDto reportBoardDto);
   
    
}
