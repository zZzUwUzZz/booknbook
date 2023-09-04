package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SellerDto;

import lombok.extern.slf4j.Slf4j;

// 이 서비스클래스 안에서는 아래 관련작업 하시면 됨요.

// 회원공통 : 회원가입·탈퇴 / 로그인·로그아웃 / 아이디·비번찾기 / 회원정보조회·수정
// 일반회원 : 즐겨찾기추가 / 찜한도서추가
// 서점회원 : 서점사진등록 / 책등록

@Slf4j
@Service
public class MemberService {

    @Autowired
    private MemberDao mDao; // DAO는 인터페이스로 만드는게 대세!!!

    public boolean updateinfo(MemberDto mDto) {
        return false;
    }




    // public MemberDto login(HashMap<String, String> member) {

    // // boolean result = mDao.login(member);
    // // return result;

    // // 비밀번호가 암호화 된 회원만 로그인 가능하도록 수정!
    // // 복호화는 안 되지만 비교는 가능
    // BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
    // // 특정회원의 암호화 된 비번 구하기
    // String encodedPwd = mDao.getSecurityPw(member.get("m_id"));

    // if (encodedPwd != null) { // 아이디가 존재함

    // // matches('입력된비번', '암호화된비번')
    // if (pwEncoder.matches(member.get("m_pwd"), encodedPwd)) {
    // log.info("비밀번호 일치");
    // return mDao.getMemberInfo(member.get("m_id"));
    // // return true;
    // } else {
    // log.info("비밀번호 불일치");
    // return null;
    // }

    // } else { // 그런 아이디 없음

    // log.info("아이디입력 오류");
    // return null;
    // }

    // }

    // public boolean join(MemberDto mDto) {

    // // 스프링Security(pom.xml디펜던시추가확인)로 비밀번호 암호화 하기!!
    // // encoding(암호화) <---> decoding(복호화) (스프링은 복호화는 안 해줌)
    // BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
    // // 1111 ---> dsjfkskhalsjflawekjfhaksdj
    // mDto.setM_pw(pwEncoder.encode(mDto.getM_pw()));

    // return mDao.join(member);

    // }

    // public String idCheck(String m_id) {

    // if (!mDao.idCheck(m_id)) { // 조건부분의 의미는 중복아이디가 없다는 뜻
    // return "ok";
    // }
    // return "fail";
    // }


    // 서점 회원 정보



    
    //수희
    public MemberDto getCustomerInfoById(String c_id) {

        return mDao.getCustomerInfoById(c_id);
    }

    @Transactional
    public void updateCustomerInfo(String c_id, MemberDto updatedMDto) {

        updatedMDto.setM_id(c_id);
        log.info("updatedMDto:{}", updatedMDto);
        
        mDao.updateMemberInfo(updatedMDto);
        mDao.updateCustomerInfo(updatedMDto);
    }

    public List<MemberDto> getFavStores(String c_id) {

        return mDao.getFavStoreList(c_id);
    }

    public List<BookDto> getFavBooks(String c_id) {

        return mDao.getFavBookList(c_id);
    }




}