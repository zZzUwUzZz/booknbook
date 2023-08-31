package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
    
    public List<String> getFavStoreList(String c_id);
    public List<HashMap<String, String>> getFavBookList(String c_id);

}
