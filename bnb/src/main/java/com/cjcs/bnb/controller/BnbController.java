package com.cjcs.bnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

 
@Controller
public class BnbController {

    @GetMapping({"/", "/booknbook"})
    public String main(Model model) {

        return "index";
        
    }
 
}
