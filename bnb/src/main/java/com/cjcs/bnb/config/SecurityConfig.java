package com.cjcs.bnb.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.SecurityConfigurer;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.security.web.DefaultSecurityFilterChain;

import com.cjcs.bnb.dao.MemberDao;
import com.cjcs.bnb.service.CustomUserDetailsService;

@Configuration
// @EnableWebSecurity
public class SecurityConfig {

    private final UserDetailsService customUserDetailsService; 

@Autowired
public SecurityConfig(UserDetailsService customUserDetailsService) {
    this.customUserDetailsService = customUserDetailsService;
}

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
                    .authorizeHttpRequests(authorizeRequests -> 
                        authorizeRequests
                        .requestMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
                            .anyRequest().authenticated()
                    )
                    .formLogin(formLogin -> 
                        formLogin
                            .loginPage("/member/login") 
                            .defaultSuccessUrl("/", true)
                            .failureForwardUrl("/login?error=true")
                    )
                    .logout(logout -> 
                        logout
                            .logoutSuccessUrl("/login?logout=true")
                    );
            }
        };
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customUserDetailsService);
        authProvider.setPasswordEncoder(bCryptPasswordEncoder());
        return authProvider;
    }
}