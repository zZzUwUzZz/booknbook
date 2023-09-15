package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.cjcs.bnb.controller.MenuController;
import com.cjcs.bnb.dto.ExtendedNotifBoardDto;
import com.cjcs.bnb.dto.StockNotifDto;
import com.cjcs.bnb.mappers.StockMapper;
import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;

// 이 서비스클래스 안에서는 아래 관련작업 하시면 됨요.

// 메인알림창
// 판매자 : 각종 주문&예약관련 알림
// 구매자 : 입고알림 / 대여예약알림
// (아무튼 알림기능과 관련된 것들)

@Slf4j
@Service
public class NotificationService {
    @Autowired
    private MenuController mCon;

    @Autowired
    StockMapper stockMapper;

        @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    
    public void sendNotification(ExtendedNotifBoardDto notification) {
        simpMessagingTemplate.convertAndSend(
            "/topic/notifications/" + notification.getNb_m_id(),
            new Gson().toJson(notification)
        );
    } 


    public void processStockNotif(String isbn, String sellerId) {
        List<StockNotifDto> usersToNotify = stockMapper.findUsersToNotify(isbn, sellerId);
        for (StockNotifDto user : usersToNotify) {
            // 알림 메시지 생성
            ExtendedNotifBoardDto notif = new ExtendedNotifBoardDto();
            notif.setNb_m_id(user.getC_id());
            notif.setNb_msg("Your book with ISBN: " + sellerId + isbn + " is now available.");
            // 추가 정보 설정 (예: 서점 이름, 책 제목 등)
            // ...

     
            // 알림 보내기
            mCon.sendNotification(notif);

            // Stock_Notif에서 사용자 제거
            stockMapper.deleteStockNotif(user);
        }
    }



}
