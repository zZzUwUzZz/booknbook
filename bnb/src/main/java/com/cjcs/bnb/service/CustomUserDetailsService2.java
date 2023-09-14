package com.cjcs.bnb.service;

import com.cjcs.bnb.dao.UserDao;
import com.cjcs.bnb.dto.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

// @Service
public class CustomUserDetailsService2 implements UserDetailsService {

    @Autowired
    private UserDao userDao;

   @Override
public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    MemberDto member = userDao.findUserByUsername(username);
    if (member == null) {
        throw new UsernameNotFoundException("User not found");
    }

    

    List<String> userAuthorities;
    if ("admin2".equals(username)) {
        userAuthorities = Collections.singletonList("ROLE_ADMIN");
    } else {
        userAuthorities = userDao.findAuthoritiesByUsername(username);
    }

    return new org.springframework.security.core.userdetails.User(member.getM_id(), member.getM_pw(),
            userAuthorities.stream().map(SimpleGrantedAuthority::new).collect(Collectors.toList()));
}
    public String encodePassword(String rawPassword) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(rawPassword);
    }

    public void encodeAndUpdatePasswordForAdmin() {
        // 여기에서 'YOUR_ADMIN2_RAW_PASSWORD'는 `admin2`의 원시 비밀번호를 나타냅니다.
        String encodedPassword = encodePassword("dlwofkr123!!");
        userDao.updateEncodedPassword("admin2", encodedPassword);
    }
    
    
}