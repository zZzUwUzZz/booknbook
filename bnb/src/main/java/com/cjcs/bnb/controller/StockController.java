package com.cjcs.bnb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cjcs.bnb.dto.StockUpdateDto;
import com.cjcs.bnb.service.StockService;

@RestController
public class StockController {
    @Autowired
    private StockService stockService;

    @PostMapping("/updateStock")
    public ResponseEntity<String> updateStock(@RequestBody StockUpdateDto stockUpdateDto) {
        boolean result = stockService.updateStock(stockUpdateDto);
        if (result) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Failure", HttpStatus.BAD_REQUEST);
        }
    }
}