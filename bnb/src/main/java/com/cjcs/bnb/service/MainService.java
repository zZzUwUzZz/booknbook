package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dto.MainInfoDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.mappers.MainMapper;

@Service
public class MainService {

    @Autowired
    private MainMapper mainMapper;

    public List<MemberDto> getMainInfos() {
        return mainMapper.getMainInfos();
    }
}