package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.cjcs.bnb.dto.BookDto;
import com.cjcs.bnb.dto.NotifBoardDto;
import com.cjcs.bnb.dto.StockNotifDto;
import com.cjcs.bnb.mappers.StockNotifMapper;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.StockNotifService;

@Controller
public class StockNotifController {
    @Autowired
    private StockNotifService stockNotifService;

    @Autowired
    private SimpMessagingTemplate template;

    @Autowired
    private BookService bSer;

    @PostMapping("/api/stockNotif")
    public ResponseEntity<String> addStockNotification(@RequestBody StockNotifDto stockNotif) {
        System.out.println("Request received for stock notification: " + stockNotif);

        boolean isAlreadyRequested = stockNotifService.checkAlreadyRequested(stockNotif);
        if (isAlreadyRequested) {
            return new ResponseEntity<>("이미 재입고 알림 신청한 상품입니다.", HttpStatus.BAD_REQUEST);
        }
        stockNotifService.addStockNotification(stockNotif);
        return new ResponseEntity<>("재입고 알림 신청이 완료되었습니다.", HttpStatus.OK);
    }

    // 재입고 알림 처리
    // @PostMapping("/api/processStock")
    // public ResponseEntity<String> processStock(@RequestBody String isbn, String
    // sellerId) {
    // ResponseEntity<String> result = stockNotifService.processStock(isbn,
    // sellerId);
    // template.convertAndSend("/topic/stockUpdate", "재고 업데이트");
    // return result;
    // }

}
