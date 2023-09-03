package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")  //이렇게 공통url을 따로 빼고 아래에서는 /member들을 생략할 수도 있다.
public class MemberController {

    // 의존성주입

    @Autowired
    public MemberService mSer;
    @Autowired
    private MemberDao mDao;


    // 여기서부터 페이지-메서드 매핑

    @GetMapping("/login")
    public String login() {

        log.info("로그인 화면(폼)");
        return "member/login";


    }

 

    @GetMapping("/lo")
    public String loginPage() {
        return "lo"; 
    }
}

