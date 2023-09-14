package com.cjcs.bnb.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.cjcs.bnb.dto.MemberDto;

import java.util.Collections;
import java.util.List;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public MemberDto findUserByUsername(String username) {
        String query = "SELECT * FROM CJCS.MEMBER WHERE M_ID = ?";
        try {
            return jdbcTemplate.queryForObject(query, 
                 new BeanPropertyRowMapper<>(MemberDto.class), username);
        } catch (Exception e) {
            return null;
        }
    }

    public List<String> findAuthoritiesByUsername(String username) {
        String query = "SELECT M_ROLE FROM CJCS.MEMBER WHERE M_ID = ?";
        return Collections.singletonList(jdbcTemplate.queryForObject(query, String.class, username));
    }

    public void updateEncodedPassword(String username, String encodedPassword) {
        String query = "UPDATE CJCS.MEMBER SET M_PW = ? WHERE M_ID = ?";
        jdbcTemplate.update(query, encodedPassword, username);
    }
    
}