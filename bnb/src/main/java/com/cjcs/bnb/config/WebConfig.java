package com.cjcs.bnb.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


// 인터셉터를 이용해서 모든 경로에서 로그인여부 체크하려고 함!
// 환경설정 클래스
@Configuration
public class WebConfig implements WebMvcConfigurer {      // 저 인터페이스를 구현하는거임.. 스프링레거시에서는 config 관련은 다 xml파일에다 했는데.. 요즘은 자바config가 대세라고..?

	// @Autowired
	// SessionInterceptor interceptor;

	// @Override
	// public void addInterceptors(InterceptorRegistry registry) {
	
	// 	registry.addInterceptor(interceptor)
	// 		.addPathPatterns("/**")                  // **로 표기하면 /아래 이중 삼중경로까지 모두 포함..
	// 		.excludePathPatterns("/", "/booknbook", "/js/**", "/css/**", "/images/**")        // 로그인 체크 배제할 경로들..
	// 		.excludePathPatterns("/join", "/login", "/idCheck");
		
	// }
	
}