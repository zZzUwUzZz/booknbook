package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cjcs.bnb.dto.ExtendedNotifBoardDto;
import com.cjcs.bnb.dto.ReportBoardDto;
import com.cjcs.bnb.service.BoardService;

@RestController
public class MenuController {

    @Autowired
    private BoardService boardService;
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