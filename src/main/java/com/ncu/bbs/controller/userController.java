package com.ncu.bbs.controller;

import com.ncu.bbs.services.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class userController {

    @Autowired
    private com.ncu.bbs.services.userService userservice;

}
