package com.cjcs.bnb.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
// import com.mailgun.api.v3.MailgunMessagesApi;
// import com.mailgun.client.MailgunClient;
// import com.mailgun.model.message.Message;
// import com.mailgun.model.message.MessageResponse;
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
    public String loginPage(HttpSession session, RedirectAttributes rttr) {
        Object loggedInUser = session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            rttr.addFlashAttribute("msg", "이미 로그인 된 상태입니다.");
            return "redirect:/";
        }
        return "/member/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String m_id, @RequestParam String m_pw, Model model, HttpSession session) {
        HashMap<String, String> memberData = new HashMap<>();
        memberData.put("m_id", m_id);
        memberData.put("m_pw", m_pw);

        MemberDto mb = mSer.login(memberData);
        if (mb != null) {
            session.setAttribute("loggedInUser", mb.getM_id());
            log.info("Logged in User ID: " + session.getAttribute("loggedInUser"));
            return "redirect:/";
        } else {
            model.addAttribute("msg", "로그인 실패");
            return "/member/login";
        }
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        Object loggedInUser = session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            model.addAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/member/login";
        }

        // 로그아웃 로직 (세션 삭제 등)
        session.invalidate();

        return "redirect:/";
    }

    @GetMapping("/findId")
    public String unregister() {

        log.info("아이디 찾기(폼)");
        return "member/findId";

    }

    @PostMapping("/findId")
    @ResponseBody
    public String findIdByEmail(@RequestParam String name, @RequestParam String email) {
        String memberId = mSer.findIdByEmail(name, email);

        if (memberId != null) {
            return memberId; // 해당 이메일과 이름으로 찾은 아이디를 응답으로 보냅니다.
        } else {
            return "not found"; // 아이디를 찾을 수 없을 경우
        }
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
    // @ResponseBody
    // @GetMapping("/emailAuth")
    // public MessageResponse sendSimpleMessage() {

    // String API_KEY = "key-02898c1623290dd7927fdc6fd18bfbab";
    // String DOMAIN_NAME = "sandbox2a9762a2df5948a194ffad1917207b6d.mailgun.org";

    // MailgunMessagesApi mailgunMessagesApi = MailgunClient.config(API_KEY)
    // .createApi(MailgunMessagesApi.class);

    // Message message = Message.builder()
    // .from("Nilla <bnb@sandbox2a9762a2df5948a194ffad1917207b6d.mailgun.org>")
    // .to("bahnnn@naver.com")
    // .subject("BOOK N BOOK - 본인인증코드")
    // .text("a126^vy23h")
    // .build();

    // return mailgunMessagesApi.sendMessage(DOMAIN_NAME, message);
    // }

    @GetMapping("/checkId2")
    @ResponseBody
    public Map<String, Boolean> checkIdDuplication2(@RequestParam String m_id) {
        boolean isDuplicated = mSer.isIdDuplicated(m_id); // mSer가 MemberService를 의미한다고 가정
        Map<String, Boolean> result = new HashMap<>();
        result.put("isDuplicated", isDuplicated);
        return result;
    }

    @GetMapping("/resetPw")
    public String resetPw() {

        log.info("비밀번호 초기화(폼)");
        return "member/resetPw";

    }

    // @PostMapping("/resetPw")
    // public String resetPassword(ResetPasswordDto dto, Model model) {
    // // 사용자 확인
    // boolean isValidUser = mSer.verifyUser(dto);

    // if(isValidUser) {
    // // 비밀번호 업데이트
    // boolean isSuccess = mSer.updatePassword(dto);

    // if(isSuccess) {
    // model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
    // return "redirect:/member/login"; // 비밀번호 변경 성공 후 로그인 페이지로 리다이렉트
    // } else {
    // model.addAttribute("error", "비밀번호 변경 중 오류가 발생하였습니다.");
    // return "member/resetPasswordForm"; // 오류 시 비밀번호 변경 폼으로 돌아감
    // }
    // } else {
    // model.addAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
    // return "member/resetPasswordForm"; // 잘못된 사용자 정보 입력 시 비밀번호 변경 폼으로 돌아감
    // }
    // }
}