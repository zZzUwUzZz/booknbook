// package com.cjcs.bnb.config;

// import org.springframework.context.annotation.Bean;
// import org.springframework.security.authentication.AuthenticationManager;
// import org.springframework.security.authentication.ProviderManager;
// import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
// import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
// import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;

// import java.util.Arrays;

// import org.springframework.beans.factory.annotation.Autowired;

// import static org.springframework.security.config.Customizer.withDefaults;
// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
// import org.springframework.security.core.userdetails.User;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.core.userdetails.UserDetailsService;
// import org.springframework.security.provisioning.InMemoryUserDetailsManager;
// import org.springframework.security.web.SecurityFilterChain;
// import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

// import lombok.RequiredArgsConstructor;

// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.security.crypto.password.PasswordEncoder;

// @EnableWebSecurity 
// @Configuration
// @RequiredArgsConstructor
// public class SecurityConfigration {

//   @Bean
// public SecurityFilterChain configure(HttpSecurity http) throws Exception {
//     http
//         .authorizeHttpRequests(authz -> authz
//             .requestMatchers(new AntPathRequestMatcher("/admin/**")).hasRole("ADMIN")
//             .anyRequest().permitAll()
//         );
//     return http.build();
// }
    
//       @Bean
//     public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfiguration) throws Exception {
//         return authConfiguration.getAuthenticationManager();
//     }
//      @Value("${spring.security.user.name}")
//     private String adminUsername;

//     @Value("${spring.security.user.password}")
//     private String adminPassword;

//     @Value("${spring.security.user.roles}")
//     private String[] adminRoles; // ADMIN 역할을 배열로 읽습니다.

//     @Bean
//     public AuthenticationManager customAuthenticationManagerBean() throws Exception {
//         DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
//         authenticationProvider.setUserDetailsService(userDetailsService(passwordEncoder()));
//         authenticationProvider.setPasswordEncoder(passwordEncoder());
    
//         return new ProviderManager(Arrays.asList(authenticationProvider));
//     }

    
// public void configure(AuthenticationManagerBuilder auth) throws Exception {
//     auth.userDetailsService(userDetailsService(passwordEncoder())).passwordEncoder(passwordEncoder());
// }

// @Bean
// public UserDetailsService userDetailsService(PasswordEncoder passwordEncoder) {
//     UserDetails admin = User.builder()
//             .username(adminUsername) // spring.security.user.name 값을 사용
//             .password(passwordEncoder.encode(adminPassword)) // spring.security.user.password 값을 사용
//             .roles(adminRoles) // spring.security.user.roles 값을 사용
//             .build();

//     return new InMemoryUserDetailsManager(admin);
// }
//     @Bean
//     public PasswordEncoder passwordEncoder() {
//         return new BCryptPasswordEncoder();
//     }

// }


    

