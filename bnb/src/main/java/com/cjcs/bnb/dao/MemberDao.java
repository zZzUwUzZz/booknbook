package com.cjcs.bnb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.MemberDto;
import com.cjcs.bnb.dto.SearchDto;
import com.cjcs.bnb.dto.SellerDto;
import com.cjcs.bnb.dto.SellerFileDto;

@Mapper
public interface MemberDao {

    // 킹효진

    List<SellerDto> searchBookstores(@Param("keyword") String keyword,
            @Param("startIdx") int startIdx,
            @Param("limit") int limit);

    int countBookstores(@Param("keyword") String keyword);

    @Select("SELECT * FROM seller_file WHERE sf_s_id = #{s_id}")
    List<SellerFileDto> getImagesBySellerId(String s_id);

    MemberDto getMemberInfo(String s_id);

    List<SellerDto> getAllBookstores();

    // 일단은 각자 필요한 쿼리문 만들어 쓰시고요.. 나중에 하나로 합칠 수 있는 건 합치겠음.

    /// 재락
    public boolean joinMember(MemberDto mDto);

    public boolean joinSeller(MemberDto mDto);

    public boolean joinCustomer(MemberDto mDto);

    public boolean join2(MemberDto mDto);

    @Select("SELECT * FROM CJCS.MEMBER WHERE M_ID = #{m_id}")
    MemberDto getMemberById(String m_id);

    // 아이디 중복확인
    int countById(String m_id);

    // 아이디 찾기
    String findIdByEmailAndName(String email, String name);

    String findIdByEmail(@Param("name") String name, @Param("email") String email);

    String findIdByEmailAndCode(@Param("name") String name, @Param("email") String email,
            @Param("verificationCode") String verificationCode);

    // 샐러
    String findSellerIdByStoreNameAndEmail(@Param("storeName") String storeName, @Param("email") String email);

    @Select("SELECT M_ID FROM CJCS.MEMBER WHERE M_EMAIL = #{email} AND M_NAME = #{name}")

    String getIdByEmailAndName(@Param("email") String email, @Param("name") String name);

    Integer verifyUser(Map<String, String> inputData);

    // 비번 초기화
    boolean resetPassword(@Param("userId") String userId, @Param("newPassword") String newPassword);

    // 회원 탈퇴
    String getEncodedPassword(String m_id);

    Boolean deleteMemberById(String m_id);

    Boolean deleteCustomerById(String m_id);

    // 예림
    public MemberDto getSellerInfoById(String m_id);

    public void updateMemberInfo(MemberDto updatedMDto);

    public void updateSellerInfo(MemberDto updatedMDto);

    public int getTodayBookmarkCnt(String s_id);

    public int getWeekBookmarkCnt(String s_id);

    public int getMonthBookmarkCnt(String s_id);

    public List<MemberDto> getCsMemberList(String s_id);

    // 수희
    public List<MemberDto> getAllCustomerInfo();

    public List<MemberDto> getCustomerListByKeyword(SearchDto sDto);

    public Integer countCustomers(SearchDto sDto);

    public List<MemberDto> getAllSellerInfo();

    public List<MemberDto> getSellerListByKeyword(SearchDto sDto);

    public Integer getDeliveryFeeByStorename(String storename);

    public Integer countSellers(SearchDto sDto);

    public MemberDto getCustomerInfoById(String m_id);

    // public void updateMemberInfo(MemberDto updatedMDto); //예림파트랑중복
    public void updateCustomerInfo(MemberDto updatedMDto);

    public Integer countFavStores(String c_id);

    public List<MemberDto> getFavStoreList(String c_id, int start, int end);

    public Integer countFavBooks(String c_id);

    public List<BookDto> getFavBookList(String c_id, int start, int end);

    public HashMap<String, String> getLatestFavStoreByCId(String c_id, int rownum);

    public HashMap<String, String> getLatestFavBookByCId(String c_id, int rownum);

}
