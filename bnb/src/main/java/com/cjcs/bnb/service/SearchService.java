package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;
import com.cjcs.bnb.mappers.FileMapper;

@Service
public class SearchService {

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private FileMapper fileMapper;

    public List<BookDto> findByKwPg(String keyword, int start, int end) {
        return bookMapper.findByKwPg(keyword, start, end);
    }

    public int countKeyword(String keyword) {
        return bookMapper.countKeyword(keyword);
    }

    // 서점 검색
    public List<SellerDto> searchBookstores(String keyword) {
        return memberDao.searchBookstores("%" + keyword + "%");
    }

    // 서점 검색 결과 총 건수
    public int countBookstores(String keyword) {
        return memberDao.countBookstores(keyword);
    }

public List<SellerFileDto> getImagesBySellerId(String s_id) {
        return fileMapper.getImagesBySellerId(s_id);
    }

}
