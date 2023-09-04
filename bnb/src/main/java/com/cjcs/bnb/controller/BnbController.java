package com.cjcs.bnb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BnbController {

    // 메인
    @GetMapping("/")
    public String main() {
        return "main";
    }

    // 지도
    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String map() {
        return "/map/map";
    }

}
