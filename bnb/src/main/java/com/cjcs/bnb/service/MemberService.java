package com.cjcs.bnb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.javassist.compiler.ast.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

    public MemberDto login(HashMap<String, String> member) {
        try {
            MemberDto mb = mDao.getMemberById(member.get("m_id"));
            if (mb != null && mb.getM_pw().equals(member.get("m_pw"))) {
                return mb;
            }
        } catch (Exception e) {
            log.error("Error occurred while trying to login: ", e);
        }
        return null;
    }

    public boolean isIdDuplicated(String m_id) {
        return mDao.countById(m_id) > 0;
    }

    public String findIdByEmail(String name, String email) {
        return mDao.findIdByEmail(name, email);
    }

    public Boolean verifyUser(Map<String, String> inputData) {
        Integer count = mDao.verifyUser(inputData);
        return count > 0;
    }

    // 비번 초기화
    public Boolean resetPassword(Map<String, String> inputData) {
        try {
            String userId = inputData.get("userId");
            String newPassword = inputData.get("newPassword");

            return mDao.resetPassword(userId, newPassword);
        } catch (Exception e) {
            // 로그 출력
            log.error("Error in resetting password in service layer: ", e);
            return false;
        }
    }

    @Autowired
    private BCryptPasswordEncoder pwEncoder;

    @Transactional
    public boolean unregister(String m_id, String m_pw) {
        try {
            // Get encoded password from the database for the user
            String encodedPwd = mDao.getEncodedPassword(m_id);

            // Check if the entered password matches the encoded password
            if (encodedPwd != null && pwEncoder.matches(m_pw, encodedPwd)) {
                return mDao.deleteMemberById(m_id) > 0;
            } else {
                return false;
            }
        } catch (Exception e) {
            log.error("Error during withdrawal: ", e);
            return false;
        }
    }

    // 탈퇴

    // @Transactional
    // public boolean withdraw(String m_id) {
    // try {
    // return mDao.delete(m_id) > 0;
    // } catch(Exception e) {
    // log.error("Error during withdrawal: ", e);
    // return false;
    // }
    // }

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

    // 수희
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

    // 예림

    // 오늘 즐겨찾기한 회원 수 카운트
    public int getTodayBookmarkCnt(String s_id) {
        return mDao.getTodayBookmarkCnt(s_id);
    }

    // 이번 주 즐겨찾기한 회원 수 카운트
    public int getWeekBookmarkCnt(String s_id) {
        return mDao.getWeekBookmarkCnt(s_id);
    }

    // 이번 달 즐겨찾기한 회원 수 카운트
    public int getMonthBookmarkCnt(String s_id) {
        return mDao.getMonthBookmarkCnt(s_id);
    }

    // 서점 이용 기록 있는 회원들 리스트 불러오기
    public List<MemberDto> getCsMemberList(String s_id) {
        return mDao.getCsMemberList(s_id);
    }

}