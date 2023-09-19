package com.cjcs.bnb.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cjcs.bnb.dto.StockNotifDto;
import com.cjcs.bnb.dto.StockUpdateDto;
import com.cjcs.bnb.service.BookService;
import com.cjcs.bnb.service.StockService;

@RestController
public class StockController {
    @Autowired
    private StockService stockService;

    @Autowired
    private SimpMessagingTemplate template;

    @PostMapping("/updateStock")
    public Boolean updateStock(@RequestBody StockUpdateDto stockUpdateDto) {
        System.out.println("Received stockUpdateDto: " + stockUpdateDto);
        return stockService.updateStock(stockUpdateDto);
    }

    @GetMapping("/findStockNotif")
    public Boolean findStockNotif(@RequestParam("isbn") String isbn, @RequestParam("sellerId") String sellerId) {
        StockNotifDto stockNotifDto = new StockNotifDto();
        stockNotifDto.setB_isbn(isbn);
        stockNotifDto.setB_s_id(sellerId);
        return stockService.findStockNotif(stockNotifDto);
    }

    @PostMapping("/insertStockNotif")
    public void insertStockNotif(@RequestBody StockNotifDto stockNotifDto) {
        stockService.insertStockNotif(stockNotifDto);
    }

    @PostMapping("/processStockNotif")
    public ResponseEntity<String> processStockNotif(@RequestBody Map<String, String> payload) {
        String isbn = payload.get("isbn");
        String sellerId = payload.get("sellerId");
        System.out.println("Received request with isbn: " + isbn + ", sellerId: " + sellerId);

        stockService.processStockNotif(isbn, sellerId);
        return ResponseEntity.ok("{\"message\": \"Processed\"}");
    }

    @PostMapping("/api/stockNotif")
    public ResponseEntity<String> addStockNotification(@RequestBody StockNotifDto stockNotif) {
        System.out.println("Request received for stock notification: " + stockNotif);

        boolean isAlreadyRequested = stockService.checkAlreadyRequested(stockNotif);
        if (isAlreadyRequested) {
            return new ResponseEntity<>("이미 재입고 알림 신청한 상품입니다.", HttpStatus.BAD_REQUEST);
        }
        stockService.addStockNotification(stockNotif);
        return new ResponseEntity<>("재입고 알림 신청이 완료되었습니다.", HttpStatus.OK);
    }

    // 재입고 알림 처리
    // @PostMapping("/api/processStock")
    // public ResponseEntity<String> processStock(@RequestBody String isbn, String
    // sellerId) {
    // ResponseEntity<String> result = stockService.processStock(isbn,
    // sellerId);
    // template.convertAndSend("/topic/stockUpdate", "재고 업데이트");
    // return result;
    // }

}
