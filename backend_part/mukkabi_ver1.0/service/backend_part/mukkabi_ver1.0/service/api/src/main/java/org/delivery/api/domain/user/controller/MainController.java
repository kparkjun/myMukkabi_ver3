package org.delivery.api.domain.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
