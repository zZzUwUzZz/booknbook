package com.cjcs.bnb.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/member")  이렇게 공통url을 따로 빼고 아래에서는 /member들을 생략할 수도 있다.
public class MemberController {
	
	@Autowired
	public MemberService mSer;
	@Autowired
	private MemberDao mDao;
	

	@GetMapping("/login")     //GET과 POST.. 서로 다른방식이므로 같은 url써도 됨.
	public String login() { 

		log.info("로그인 화면(폼)");
		return "login";
		
	}
	
	@PostMapping("/login")     //GET과 POST.. 서로 다른방식이므로 같은 url써도 됨.
	public String login(@RequestParam HashMap<String, String> member, Model model, HttpSession session, RedirectAttributes rttr) {     // Dto객체 대신 해시맵을 쓰고싶다면 이렇게..
//	public String login(@ModelAttribute("mb") MemberDto member, Model model) {    // 아래처럼 요청객체 파라미터에 일일이 어노테이션 다느니.. DTO만들어서 객체를 통으로 넣자. ModelAttribute어노테이션은 생략 가능
//	public String login(@RequestParam String m_id, @RequestParam("m_pwd") String pw) {    // 요청객체 파라미터 가져오기.. 파라미터명이 괄호 안과 같다면 괄호부분 생략 가능!
//  String, Integer, int, double 등 단순타입이면 @RequestParam에 넣고, 변수명과=파라미터명이면 어노테이션 생략 가능
//  MemberDto 등 단순 타입이 아니면 @ModelAttribute 를 쓰는데, 마찬가지로 어노테이션 생략 가능..
//  이때 예외가 있는데, 해시맵은 @ModelAttribute가 아니라 (@RequestParam HashMap<String,String> member) 이렇게 명시해줘야함! 생략하면 리퀘말고모델이 적용되어버려서 해시맵 제대로 작동X.. 에러남
		
		log.info("로그인 처리");
		log.info("id:{}, pw:{}", member.get("m_id"), member.get("m_pwd"));
//		log.info("id:{}, pw:{}", member.getM_id(), member.getM_pwd());
//        // log.info("id:{}, pw:{}", m_id, pw);
//		// model.addAttribute("mb2", member);
		
		MemberDto result = mSer.login(member);
		
		if (result != null) {
//			session.setAttribute("id", member.get("m_id"));   // 세션은 무거워지면 안 되니까 원칙적으로는 이렇게 아이디만 저장해두고 필요한 다른 회원정보 있을때마다 DB에 다녀오게 해야함!
			session.setAttribute("mb", result);               // 세션에 이렇게 회원정보 전부 올려놓고 DB에 다녀올 필요 없이 바로 가져다 쓸 수도 있음... but 세션이 무거워져서 비추
			return "redirect:/board/list?pageNum=1";
//			return "boardList";
		} else {
//			model.addAttribute("msg", "로그인 실패");     // request객체 대신에 model을 쓰고있음...
			rttr.addFlashAttribute("msg", "로그인 실패");
			return "login";
		}
		
	}
	
	
	@GetMapping("/logout")     //저 url을 주소창에 직접 쳐서 접속하는 것도 GET요청임!! 이렇게 로그아웃하는 방식을 막으려고 하고 있음
	public String logout(RedirectAttributes rttr) {
		
		log.info("로그아웃 실패");
		rttr.addFlashAttribute("msg", "로그아웃 버튼을 이용하세요...");
		return "redirect:/board/list";
		
	}
	
	@PostMapping("/logout")     //로그아웃버튼을 form태그에 method="POST" 지정해서 폼 안에 작성해야 함..
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		log.info("로그아웃 처리");
		rttr.addFlashAttribute("msg", "로그아웃 성공");
		session.invalidate();
		return "redirect:/";
		
	}
	
	
	@GetMapping("/join")     //GET과 POST.. 서로 다른방식이므로 같은 url써도 됨.
	public String join() {

		log.info("회원가입 화면(폼)");
		return "join";
		
	}
	
	@PostMapping("/join")     //GET과 POST.. 서로 다른방식이므로 같은 url써도 됨.
	public String join(MemberDto member, Model model, RedirectAttributes rttr) {
		
		
		log.info("회원가입 처리");
		log.info("member:{}", member);    // @Data에 의해 ToString오버라이딩처리도 되어있으므로
		
		boolean result = mSer.join(member);
		
		if (result) {
			
		 // session.setAttribute("msg", "회원가입 성공");       // session영역에 저장하려면 이렇게 해야하는데.. 세션이 무거워지는 건 지양해야하니까 아래처럼 하자 그냥..
			rttr.addFlashAttribute("msg", "회원가입 성공");     // request영역에 속성으로 저장, 얘는 1회성 저장이기 때문에 F5만 눌러도 삭제됨(참고로 F5는 재요청 아님) 
	     // rttr.addAttribute("msg", "회원가입 성공");          // request객체에 파라미터로 저장, F5누르면 재요청이 아니기 때문에 계속 사용가능, 아래 리턴이 리다이렉트일 때만 쓸 수 있다고 함... 왜-_-??
			
		 // return "login";
			return "redirect:/";   // "/"만 써버리면 /.jsp가 되니까.. 스프링에서 리다이렉트 쓰려면 저렇게 하면 됨. "redirect:/url(뷰페이지(.jsp)가 아닌 컨텍스트경로)"
			
		} else {
			model.addAttribute("msg", "회원가입 실패");
			return "join";
		}

	}
	
}