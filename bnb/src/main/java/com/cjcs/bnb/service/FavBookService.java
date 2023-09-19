package com.cjcs.bnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dto.FavBookDTO;
import com.cjcs.bnb.mappers.FavBookMapper;

@Service
public class FavBookService {
    @Autowired
    private FavBookMapper favBookMapper;

    public Integer getFavState(FavBookDTO favBookDTO) {
        if (favBookDTO == null || favBookDTO.getFavb_c_id() == null) {
            return 0; // 로그인하지 않은 사용자에 대한 처리
        }
        Integer favState = favBookMapper.getFavState(favBookDTO);
        return favState != null ? favState : 0;
    }

    public int checkAndToggleFav(FavBookDTO favBookDTO) {
        Integer favState = favBookMapper.getFavState(favBookDTO);
        if (favState == null) {
            favState = 0; // 또는 적절한 기본값 또는 예외처리
        }
        if (favState == 1) {
            favBookMapper.removeFav(favBookDTO);
            return 0;
        } else {
            favBookMapper.addFav(favBookDTO);
            return 1;
        }
    }
}