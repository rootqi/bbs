package com.ncu.bbs.controller;

import com.ncu.bbs.bean.Msg;
import com.ncu.bbs.bean.administrator;
import com.ncu.bbs.services.AdministratorService;
import com.ncu.bbs.services.impl.AdministratorServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class adminController {
    @Autowired
    AdministratorService administratorService;


    @RequestMapping("/checkaAdminname")
    @ResponseBody
    public Msg checkaAdminname(HttpServletRequest request){
        String aAdminname = request.getParameter("aAdminname");
        System.out.print(aAdminname);
        boolean b = administratorService.checkaAdminname(aAdminname);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping("/checkaPassword")
    @ResponseBody
    public Msg checkaPassword(HttpServletRequest request){
        String aPassword = request.getParameter("aPassword");
        System.out.print(aPassword);
        boolean b = administratorService.checkaPassword(aPassword);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }
}
