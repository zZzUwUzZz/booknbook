package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cjcs.bnb.dto.ExtendedNotifBoardDto;

@RestController
@Controller
public class MenuController {

    
  @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    public void sendNotification(ExtendedNotifBoardDto notification) {
        simpMessagingTemplate.convertAndSend("/topic/notifications/" + notification.getNb_m_id(), notification);
    }

    @RequestMapping("/books")
    public String books() {
        return "/books/books";
    }

}