package com.cjcs.bnb.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.SecurityConfigurer;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.DefaultSecurityFilterChain;

import com.cjcs.bnb.service.CustomUserDetailsService2;

@Configuration
public class SecurityConfig  {
    

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityConfigurer<DefaultSecurityFilterChain, HttpSecurity> securityConfigurer() {
        return new SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity>() {
            @Override
            public void configure(HttpSecurity http) throws Exception {
                http
                    .authorizeHttpRequests(authorizeHttpRequests -> 
                        authorizeHttpRequests
                            .requestMatchers("/admin/**").hasRole("ADMIN")
                            .requestMatchers("/**").authenticated()
                    )
                    .formLogin(formLogin -> 
                        formLogin
                            .loginPage("/member/login")
                            .defaultSuccessUrl("/", true)
                            .failureForwardUrl("/login?error=true")
                    )
                    .logout(logout -> 
                        logout
                            .logoutSuccessUrl("/member/login")
                    );
            }
            };
        }
    

    

    @Bean
    public UserDetailsService customUserDetailsService2() {
        return new CustomUserDetailsService2();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customUserDetailsService2()); // 명시적으로 CustomUserDetailsService2 빈을 사용합니다.
        authProvider.setPasswordEncoder(bCryptPasswordEncoder());
        return authProvider;
    }
    
    
}