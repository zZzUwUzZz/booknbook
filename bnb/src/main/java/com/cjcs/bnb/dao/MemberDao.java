package com.cjcs.bnb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SellerDto;

@Mapper
public interface MemberDao {


    List<SellerDto> searchBookstores(@Param("keyword") String keyword);

    int countBookstores(@Param("keyword") String keyword);

    
    //일단은 각자 필요한 쿼리문 만들어 쓰시고요.. 나중에 하나로 합칠 수 있는 건 합치겠음.

    //재락
    public boolean joinMember(MemberDto mDto);
    public boolean joinSeller(MemberDto mDto);
    public boolean joinCustomer(MemberDto mDto);



    //예림
    public MemberDto getSellerInfoById(String m_id);
    public void updateMemberInfo(MemberDto updatedMDto);
    public void updateSellerInfo(MemberDto updatedMDto);



    //수희
    public MemberDto getCustomerInfoById(String m_id);
    //public void updateMemberInfo(MemberDto updatedMDto); //예림파트랑중복
    public void updateCustomerInfo(MemberDto updatedMDto);

    public List<MemberDto> getFavStoreList(String c_id);
    public List<BookDto> getFavBookList(String c_id);


}
