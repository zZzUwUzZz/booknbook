package com.cjcs.bnb.service;

import java.time.LocalDate;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.common.Paging;
import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dao.OrderDao;
import com.cjcs.bnb.dao.PurchaseDao;
import com.cjcs.bnb.dao.RentalDao;
import com.cjcs.bnb.dao.ReportBoardDao;
import com.cjcs.bnb.dto.ReportBoardDto;
import com.cjcs.bnb.dto.SearchDto;

import lombok.extern.slf4j.Slf4j;

// 이 서비스클래스 안에서는 아래 관련작업 하시면 됨요.

// 독립서점제보
// (아무튼 게시판형태의 기능)

@Slf4j
@Service
public class BoardService {
    
    @Autowired
    private ReportBoardDao rbDao;
    @Autowired
    private MemberDao mDao;
    @Autowired
    private OrderDao oDao;
    @Autowired
    private PurchaseDao pDao;
    @Autowired
    private RentalDao rDao;
    

    public String getPageboxHtml(SearchDto sDto, String listUrl) {

        int totalNum = 0;

        switch (listUrl) {
            case "/admin/reportlist":
                totalNum = rbDao.countReports(sDto);   //전체 글의 개수, 키워드 있거나 없거나
                break;
            case "/admin/sellerlist":
                totalNum = mDao.countSellers(sDto);
                break;
            case "/admin/customerlist":
                totalNum = mDao.countCustomers(sDto);
                break;
            case "/mypage/orderlist":
                totalNum = oDao.countOrdersByDateRange(sDto);   //전체 결과 개수, 조회기간 있거나 없거나
                break;
            case "/mypage/purchaselist":
                totalNum = pDao.countPurchasesByDateRange(sDto);
                break;
            case "/mypage/rentallist":
                totalNum = rDao.countRentalsByDateRange(sDto);
                break;
            case "/mypage/refundexchangelist":
                totalNum = pDao.countRefExchsByDateRange(sDto);
                break;
            case "/mypage/rentalreservationlist":
                totalNum = rDao.countReservationsByDateRange(sDto);
        }

		if (sDto.getColname() != null) {
			listUrl += "?colname="+sDto.getColname()
			         + "&keyword="+sDto.getKeyword()+"&";
		}

        if (sDto.getStartDate() != null) {
            listUrl += "?startDate="+sDto.getStartDate()
                     + "&endDate="+sDto.getEndDate()+"&";
        } else {
			listUrl +="?";
        }

		Paging paging=new Paging(totalNum, sDto.getPageNum(), sDto.getListCnt(), sDto.getPageCnt(), listUrl);

		return paging.makeHtmlPaging();

	}

    public void insertReport(ReportBoardDto reportBoardDto){
        rbDao.insertReport(reportBoardDto);
    }

}
