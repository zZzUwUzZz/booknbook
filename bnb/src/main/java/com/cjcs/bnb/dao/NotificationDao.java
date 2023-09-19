package com.cjcs.bnb.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NotificationDao {

    public int addToNotifboard(String c_id, String sort, String isbn, String s_id, String title, String storename);
    
}
