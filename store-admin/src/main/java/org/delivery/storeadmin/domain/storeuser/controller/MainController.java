package org.delivery.storeadmin.domain.storeuser.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String home(){
        return "redirect:/index.html";
    }

    @GetMapping("index")
    public String contact(){
        return "index";
    }

    @GetMapping("member/signup")
    public String jspHome(){
        return "member/signup";
    }

    @GetMapping("login/login")
    public String login(){
        return "login/loginModal";
    }

}
