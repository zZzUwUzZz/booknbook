package com.cjcs.bnb.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cjcs.bnb.dto.ExtendedNotifBoardDto;
import com.cjcs.bnb.service.NotificationService;

@RestController
public class NotificationController {
    @Autowired
    private NotificationService notificationService;

    @GetMapping("/notifications")
    public List<ExtendedNotifBoardDto> getNotifications(@RequestParam String userId) {
        return notificationService.getNotifications(userId);
    }

    @PostMapping("/markAllAsRead")
    public void markAllAsRead(@RequestParam String userId) {
        notificationService.markAllAsRead(userId);
    }

}