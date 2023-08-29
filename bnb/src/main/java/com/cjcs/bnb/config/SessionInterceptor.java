// package com.cjcs.bnb.config;

// import org.springframework.stereotype.Component;
// import org.springframework.web.servlet.AsyncHandlerInterceptor;

// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;
// import lombok.extern.slf4j.Slf4j;


// @Component
// @Slf4j
// public class SessionInterceptor implements AsyncHandlerInterceptor {

// 	@Override     // controller 진입 전에 호출됨
// 	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
// 		log.info("preHandle call");
		
// 		HttpSession session = request.getSession();
		
// 		if (session.getAttribute("mb") == null) {
// 			log.info("인터셉트! - 로그인 안 함");
// 			response.sendRedirect("/");    // home.jsp
// 			return false;
// 		} 
		
// 		return true;     // true반환일 때 controller로 진입 가능
// 	}

// //	@Override     // controller 진입 후에 호출됨
// //	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
// //		// TODO Auto-generated method stub
// //		AsyncHandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
// //	}
// //
// //	@Override
// //	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
// //		// TODO Auto-generated method stub
// //		AsyncHandlerInterceptor.super.afterCompletion(request, response, handler, ex);
// //	}
	
// }