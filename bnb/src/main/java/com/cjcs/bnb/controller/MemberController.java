package com.cjcs.bnb.controller;

import java.util.HashMap;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member") // 이렇게 공통url을 따로 빼고 아래에서는 /member들을 생략할 수도 있다.
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

    @PostMapping("/login")
    public String loginProcess(@RequestParam String m_id, @RequestParam String m_pw, Model model) {
        HashMap<String, Object> resultMap = new HashMap<>();
        MemberDto member = mDao.getMemberById(m_id);

        if (member != null && member.getM_pw().equals(m_pw)) {
            resultMap.put("success", true);
            resultMap.put("message", "로그인 성공");
            // 세션 설정 등 필요한 로직 추가
            return "redirect:/"; // 예: 홈으로 리다이렉트
        }

        resultMap.put("success", false);
        resultMap.put("message", "Invalid ID or Password");
        model.addAllAttributes(resultMap);
        return "member/login";
    }

    @GetMapping("/unregister")
    public String unregister() {

        log.info("아이디 찾기(폼)");
        return "member/unregister";

    }

    @GetMapping("/choice")
    public String choice() {

        log.info("회원가입 선택(폼)");
        return "member/choice";

    }

    @GetMapping("/join")
    public String join() {

        log.info("개인회원가입(폼)");
        return "member/join";

    }

    @PostMapping("/join")
    public String joinProcess(MemberDto member, Model model) {

        HashMap<String, Object> resultMap = new HashMap<>();

        try {
            mDao.joinMember(member);
            mDao.joinCustomer(member);
            resultMap.put("success", true);
            resultMap.put("message", "회원가입 성공");
        } catch (Exception e) {
            resultMap.put("success", false);
            resultMap.put("message", "회원가입 실패: " + e.getMessage());
        }

        model.addAllAttributes(resultMap);
        return resultMap.get("success") == Boolean.TRUE ? "redirect:/member/login" : "member/join";
    }

    @GetMapping("/join2")
    public String join2() {

        log.info("개인회원가입(폼)");
        return "member/join2";

    }

    @PostMapping("/join2")
    public String join2Process(MemberDto member, Model model) {

        HashMap<String, Object> resultMap = new HashMap<>();

        try {
            mDao.joinMember(member); // 공통 회원 정보 저장
            mDao.joinSeller(member); // 판매자 정보 저장
            resultMap.put("success", true);
            resultMap.put("message", "판매자 회원가입 성공");
        } catch (Exception e) {
            resultMap.put("success", false);
            resultMap.put("message", "판매자 회원가입 실패: " + e.getMessage());
        }

        model.addAllAttributes(resultMap);
        return resultMap.get("success") == Boolean.TRUE ? "redirect:/member/login" : "member/join2";
    }

}
