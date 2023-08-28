package com.cjcs.bnb.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {

	@Autowired
	private MemberDao mDao;         // DAO는 인터페이스로 만드는게 대세!!!
	
	public MemberDto login(HashMap<String, String> member) {

//		boolean result = mDao.login(member);
//		return result;
		
	    // 비밀번호가 암호화 된 회원만 로그인 가능하도록 수정!
		// 복호화는 안 되지만 비교는 가능
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		// 특정회원의 암호화 된 비번 구하기
		String encodedPwd = mDao.getSecurityPw(member.get("m_id"));
		
		if (encodedPwd != null) {   // 아이디가 존재함
			
			// matches('입력된비번', '암호화된비번')
			if (pwEncoder.matches(member.get("m_pwd"), encodedPwd)) {
				log.info("비밀번호 일치");
				return mDao.getMemberInfo(member.get("m_id"));
//				return true;
			} else {
				log.info("비밀번호 불일치");
				return null;
			}
			
		} else {   // 그런 아이디 없음
			  
			log.info("아이디입력 오류");
			return null;
		}
		
	}

	public boolean join(MemberDto member) {
		
	    // 스프링Security(pom.xml디펜던시추가확인)로 비밀번호 암호화 하기!!
		// encoding(암호화) <---> decoding(복호화)  (스프링은 복호화는 안 해줌(기껏 암호화한 비밀번호를 되돌릴 수 있으면 무슨 의미-_-?))
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		// 1111 ---> dsjfkskhalsjflawekjfhaksdj
		member.setM_pw(pwEncoder.encode(member.getM_pw()));
		
		return mDao.join(member);
		
	}

	public String idCheck(String m_id) {
		
		if (!mDao.idCheck(m_id)) {   // 조건부분의 의미는 중복아이디가 없다는 뜻
			return "ok";
		}
		return "fail";
	}
	
}