package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;

@Mapper
public interface MemberDao {
    
    //일단은 각자 필요한 쿼리문 만들어 쓰시고요.. 나중에 하나로 합칠 수 있는 건 합치겠음.

    //재락
    public boolean joinMember(MemberDto mDto);
    public boolean joinSeller(MemberDto mDto);
    public boolean joinCustomer(MemberDto mDto);



    //예림
    public MemberDto getSellerInfo(String m_id);
    public void updateMemberInfo(MemberDto mDto);
    public void updateSellerInfo(MemberDto mDto);



    //수희
    public MemberDto getCustomerInfo(String m_id);
    //public void updateMemberInfo(MemberDto mDto); //예림파트랑중복
    public void updateCustomerInfo(MemberDto mDto);

    public List<MemberDto> getFavStoreList(String c_id);
    public List<BookDto> getFavBookList(String c_id);

}
