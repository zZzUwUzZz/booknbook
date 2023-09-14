package com.cjcs.bnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.NotifBoardDto;
import com.cjcs.bnb.dto.StockNotifDto;
import com.cjcs.bnb.mappers.StockNotifMapper;

@Service
public class StockNotifService {
    @Autowired
    private StockNotifMapper stockNotifMapper;

     @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
 


    public boolean checkAlreadyRequested(StockNotifDto stockNotif) {
        return stockNotifMapper.findStockNotif(stockNotif) != null;
    }

    public void addStockNotification(StockNotifDto stockNotif) {
        System.out.println("Adding stock notification: " + stockNotif);
        stockNotifMapper.insertStockNotif(stockNotif);
    }

    // 재입고 알림 처리
    @Transactional
    public ResponseEntity<String> processStock(String isbn, String sellerId) {
        System.out.println("Processing stock for ISBN: " + isbn + ", SellerID: " + sellerId);

     
        List<StockNotifDto> usersToNotify = stockNotifMapper.findUsersToNotify(isbn, sellerId);
        for (StockNotifDto user : usersToNotify) {
            // 알림 메시지 생성
            NotifBoardDto notif = new NotifBoardDto();
            notif.setNb_m_id(user.getC_id());
            notif.setNb_msg("Your book with ISBN: " + isbn + " is now available.");

            // 알림 추가
            stockNotifMapper.insertNotification(notif);

            // 신청자 정보 삭제
            stockNotifMapper.deleteStockNotif(user);

            simpMessagingTemplate.convertAndSend("/topic/notifications/customer001", notif.getNb_msg());

        }
        return new ResponseEntity<>("Processed", HttpStatus.OK);
    }
}
