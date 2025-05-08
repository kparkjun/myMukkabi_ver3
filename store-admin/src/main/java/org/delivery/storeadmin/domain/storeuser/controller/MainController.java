package org.delivery.storeadmin.domain.storeuser.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("index")
    public String contact(){
        return "index";
    }

    @GetMapping("order/order")
    public String home(){
        return "order/order";
    }

    @GetMapping("login/loginModal")
    public String login(){
        return "login/loginModal";
    }

}