package com.cjcs.bnb.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.SecurityConfigurer;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.bind.annotation.RequestMapping;

@Configuration
public class SecurityConfig {
    
   @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(PasswordEncoder passwordEncoder) {
        var manager = new InMemoryUserDetailsManager();
        var user = User.withUsername("admin2")
                .password(passwordEncoder.encode("fkrwo123!!"))
                .roles("ADMIN")
                .build();
        manager.createUser(user);
        return manager;
    }

    @Bean
    public SecurityConfigurer<DefaultSecurityFilterChain, HttpSecurity> securityConfigurer() {
        return new SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity>() {
            @Override
            public void configure(HttpSecurity http) throws Exception {
                http
                    .authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                            .requestMatchers("/admin/**").hasRole("ADMIN")
                            .anyRequest().authenticated()
                    )
                    .formLogin(formLogin ->
                        formLogin
                            .loginPage("/member/login")  // 추가
                            .defaultSuccessUrl("/loginSuccess", true)
                            .failureForwardUrl("/login?error=true")
                    )
                    .logout(logout ->
                        logout
                            .logoutSuccessUrl("/login?logout=true")
                    );
            }
        };
    }
}