package com.cjcs.bnb.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.NotifBoardDto;
import com.cjcs.bnb.dto.StockNotifDto;
import com.cjcs.bnb.dto.StockUpdateDto;

@Mapper
public interface StockMapper {
    int updateStock(StockUpdateDto stockUpdateDto);

    List<StockNotifDto> getNotifList(String b_s_id, String b_isbn);

    void addNotifToBoard(NotifBoardDto notifBoard);

    void removeNotif(StockNotifDto notif);

    List<BookDto> SellerBookListDT(String s_id);

    List<BookDto> SellerBookListDT(String s_id, @Param("filter") String filter,
            @Param("keyword") String keyword);

    BookDto BookInfoDt(String isbn, String s_id);

    StockNotifDto findStockNotif(StockNotifDto stockNotif);

    String findstorename(String sellerId);

    // 재입고 알림 신청
    void insertStockNotif(StockNotifDto stockNotif);

    // 알림을 보낼 사용자 찾기
    List<StockNotifDto> findUsersToNotify(String isbn, String sellerId);

    // 알림 추가
    void insertNotification(NotifBoardDto notifBoard);

    // 신청자 정보 삭제
    void deleteStockNotif(StockNotifDto stockNotif);

    void updateStock(BookDto bDto);

    void deleteAndNotify(BookDto bDto);

}