package com.cjcs.bnb.service;

import java.util.Date; // java.util.Date를 import
import java.sql.Timestamp; // java.sql.Timestamp를 import

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.NotifBoardDto;
import com.cjcs.bnb.dto.StockNotifDto;
import com.cjcs.bnb.dto.StockUpdateDto;
import com.cjcs.bnb.mappers.StockMapper;

@Service
public class StockService {
    @Autowired
    private StockMapper stockMapper;

    public boolean updateStock(StockUpdateDto stockUpdateDto) {
        return stockMapper.updateStock(stockUpdateDto) > 0;
    }

    public List<BookDto> SellerBookListDT(String s_id, String filter, String keyword) {
        return stockMapper.SellerBookListDT(s_id, filter, keyword);
    }

    public BookDto BookInfoDt(String isbn, String sellerId) {
        return stockMapper.BookInfoDt(isbn, sellerId);
    }

}