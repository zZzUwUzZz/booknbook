package com.cjcs.bnb.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.Response;
import com.cjcs.bnb.service.MemberService;

import jakarta.servlet.http.HttpSession;
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
    public String login(@RequestParam String m_id, @RequestParam String m_pw,
            RedirectAttributes rttr, HttpSession session) {
        HashMap<String, String> memberData = new HashMap<>();
        memberData.put("m_id", m_id);
        memberData.put("m_pw", m_pw);

        MemberDto mb = mSer.login(memberData);

        if (mb != null) {
            session.setAttribute("loggedInUser", mb.getM_id()); // 사용자 아이디를 세션에 저장
            return "redirect:/";
        } else {
            rttr.addFlashAttribute("msg", "로그인 실패");
            return "redirect:/member/login";
        }
    }

    @GetMapping("/unregister")
    public String unregister() {

        log.info("아이디 찾기(폼)");
        return "member/unregister";

    }

    @Autowired
    private MemberService mService;

    @PostMapping("/sendVerificationCode")
    public ResponseEntity<?> sendVerificationCode(@RequestParam String email) {
        // 이메일로 인증 코드 전송
        boolean isSent = mService.sendVerificationCode(email);
        if (isSent) {
            return ResponseEntity.ok().body(new Response(true, "인증 코드 전송 성공"));
        }
        return ResponseEntity.badRequest().body(new Response(false, "인증 코드 전송 실패"));
    }

    @PostMapping("/findId")
    public ResponseEntity<?> findId(@RequestParam String name, @RequestParam String email, @RequestParam String verificationCode) {
        // 이메일 및 인증 코드로 아이디 찾기
        String foundId = mService.findIdByEmailAndCode(name, email, verificationCode);
        if (foundId != null) {
            return ResponseEntity.ok().body(new Response(true, foundId));
        }
        return ResponseEntity.badRequest().body(new Response(false, "아이디를 찾을 수 없습니다."));
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

    @GetMapping("/checkId")
    @ResponseBody
    public Map<String, Boolean> checkIdDuplication(@RequestParam String m_id) {
        boolean isDuplicated = mSer.isIdDuplicated(m_id);
        Map<String, Boolean> result = new HashMap<>();
        result.put("isDuplicated", isDuplicated);
        return result;
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

    @GetMapping("/checkId2")
    @ResponseBody
    public Map<String, Boolean> checkIdDuplication2(@RequestParam String m_id) {
        boolean isDuplicated = mSer.isIdDuplicated(m_id);  // mSer가 MemberService를 의미한다고 가정
        Map<String, Boolean> result = new HashMap<>();
        result.put("isDuplicated", isDuplicated);
        return result;
    }
}