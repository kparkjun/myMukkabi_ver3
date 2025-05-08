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
        return "main";
    }

    @GetMapping("/main")
    public String home2(){
        return "main";
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

    @GetMapping("store-menu/signup")
    public String storesignup(){return "store-menu/signup";}

    @GetMapping("store-menu/loginModal")
    public String menulogin(){return "store-menu/loginModal";}

    @GetMapping("main_detail/main_detail")
    public String main_detail(){return "main_detail/main_detail";}


}
