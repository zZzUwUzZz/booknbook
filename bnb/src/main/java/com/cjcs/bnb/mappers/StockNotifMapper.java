package com.cjcs.bnb.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.NotifBoardDto;
import com.cjcs.bnb.dto.StockNotifDto;

@Mapper
public interface StockNotifMapper {
    StockNotifDto findStockNotif(StockNotifDto stockNotif);

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
