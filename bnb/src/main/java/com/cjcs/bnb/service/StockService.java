package com.cjcs.bnb.service;

import java.util.Date; // java.util.Date를 import
import java.sql.Timestamp; // java.sql.Timestamp를 import

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjcs.bnb.dao.BookMapper;
import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.ExtendedNotifBoardDto;
import com.cjcs.bnb.dto.NotifBoardDto;
import com.cjcs.bnb.dto.StockNotifDto;
import com.cjcs.bnb.dto.StockUpdateDto;
import com.cjcs.bnb.mappers.StockMapper;
import com.google.gson.Gson;

@Service
public class StockService {
    @Autowired
    private StockMapper stockMapper;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @Autowired
    private BookMapper bookMapper;

    public boolean updateStock(StockUpdateDto stockUpdateDto) {
        return stockMapper.updateStock(stockUpdateDto) > 0;
    }

    public List<BookDto> SellerBookListDT(String s_id, String filter, String keyword) {
        return stockMapper.SellerBookListDT(s_id, filter, keyword);
    }

    public BookDto BookInfoDt(String isbn, String sellerId) {
        return stockMapper.BookInfoDt(isbn, sellerId);
    }

    public boolean findStockNotif(StockNotifDto stockNotifDto) {
        return stockMapper.findStockNotif(stockNotifDto) != null;
    }

    public void insertStockNotif(StockNotifDto stockNotifDto) {
        stockMapper.insertStockNotif(stockNotifDto);
    }

    // // 재입고 신청자들에게 보낼 알림창 목록
    // public void processStockNotif(String isbn, String sellerId) {
    // List<StockNotifDto> usersToNotify = stockMapper.findUsersToNotify(isbn,
    // sellerId);
    // for (StockNotifDto user : usersToNotify) {
    // // Create notification message
    // NotifBoardDto notif = new NotifBoardDto();
    // notif.setNb_m_id(user.getC_id());
    // notif.setNb_msg("입고완");

    // // Add notification
    // stockMapper.insertNotification(notif);

    // // Remove the user from Stock_Notif
    // stockMapper.deleteStockNotif(user);
    // }
    // }

    // 웹소켓 이용
    public void processStockNotif(String isbn, String sellerId) {
        List<StockNotifDto> usersToNotify = stockMapper.findUsersToNotify(isbn, sellerId);
        // 해당 책과 서점 정보 불러오기
        BookDto bookInfo = bookMapper.findBookStock(isbn, sellerId);

        String storeName = stockMapper.findstorename(sellerId);

        for (StockNotifDto user : usersToNotify) {
            // 알림 메시지 생성
            ExtendedNotifBoardDto notif = new ExtendedNotifBoardDto();
            notif.setNb_m_id(user.getC_id());
            notif.setNb_msg("입고");

            notif.setS_storename(storeName);

            notif.setB_title(bookInfo.getB_title()); // DB에서 가져온 정보

            // 책 ISBN과 판매자 ID 설정
            notif.setS_storename(storeName);
            notif.setB_title(bookInfo.getB_title());
            notif.setB_isbn(bookInfo.getB_isbn());
            notif.setB_s_id(bookInfo.getB_s_id());

            // 알림 보내기
            System.out.println("notiftext : " + notif);
            sendNotification(notif);

            // Add notification
            stockMapper.insertNotification(notif);

            // // Stock_Notif에서 사용자 제거
            stockMapper.deleteStockNotif(user);
        }
    }

    public void sendNotification(ExtendedNotifBoardDto notification) {

        simpMessagingTemplate.convertAndSend(
                "/topic/notifications/" + notification.getNb_m_id(),
                new Gson().toJson(notification));
    }

    //
    public boolean checkAlreadyRequested(StockNotifDto stockNotif) {
        return stockMapper.findStockNotif(stockNotif) != null;
    }

    public void addStockNotification(StockNotifDto stockNotif) {
        System.out.println("Adding stock notification: " + stockNotif);
        stockMapper.insertStockNotif(stockNotif);
    }

}