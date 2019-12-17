package com.ncu.bbs.controller;

import com.ncu.bbs.bean.Msg;
import com.ncu.bbs.bean.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class userController {

    @Autowired
    com.ncu.bbs.services.userService userservice;

    /**
     * 用户注册信息保存
     * @param
     * @return
     */
//    @RequestMapping(value="/reguser",method = RequestMethod.POST)
//    @ResponseBody
//    public Msg saveUser(@RequestParam("uUserid") String uUserid,
//                        @RequestParam("uPassword") String uPassword,
//                        @RequestParam("uNickname") String uNickname,
//                        @RequestParam("uEmail") String uEmail,
//                        @RequestParam("uName") String uName,
//                        @RequestParam("uWorkplace") String uWorkplace,
//                        @RequestParam("uSex") String uSex
//    ){
//        user user = new user();
//        user.setuUserid(uUserid);
//        System.out.print(uName);
//        user.setuPassword(uPassword);
//        user.setuNickname(uNickname);
//        user.setuEmail(uEmail);
//        user.setuName(uName);
//        user.setuWorkplace(uWorkplace);
//        user.setuSex(uSex);
//        userservice.saveUser(user);
//        return Msg.success();
//    }
    @RequestMapping(value="/reguser",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveUser(HttpServletRequest request){
        String uName = request.getParameter("uName");
        String uAge = request.getParameter("uAge");
        String uUserid = request.getParameter("uUserid");
        String uNickname = request.getParameter("uNickname");
        String uEmail = request.getParameter("uEmail");
        String uPassword = request.getParameter("uPassword");
        String uSex = request.getParameter("uSex");
        String uWorkplace = request.getParameter("uWorkplace");
        user user = new user();
        user.setuUserid(uUserid);
        user.setuAge(uAge);
        user.setuPassword(uPassword);
        user.setuNickname(uNickname);
        user.setuEmail(uEmail);
        user.setuName(uName);
        user.setuWorkplace(uWorkplace);
        user.setuSex(uSex);
        System.out.print(uName);
        userservice.saveUser(user);
        return Msg.success();
    }

    /**
     * 检查用户账号是否可用
     * @param uUserid
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuUserid")
    public Msg checkuUserid(HttpServletRequest request){
        String uUserid = request.getParameter("uUserid");
        System.out.print(uUserid);
        boolean b=userservice.checkuUserid(uUserid);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }
//    @RequestMapping(value="/reguser",method = RequestMethod.POST)
//    @ResponseBody
//    public Msg saveUser(@RequestParam(name = "uUserid", required = false) String uUserid,
//                        @RequestParam(name = "uPassword", required = false) String uPassword,
//                        @RequestParam(name = "uNickname", required = false) String uNickname,
//                        @RequestParam(name = "uEmail", required = false) String uEmail,
//                        @RequestParam(name = "uName", required = false) String uName,
//                        @RequestParam(name = "uWorkplace", required = false) String uWorkplace,
//                        @RequestParam(name = "uWorkproperty", required = false) String uWorkproperty,
//                        @RequestParam(name = "uSex", required = false) String uSex
//                        ){
//        System.out.print(uUserid);
//        user user = new user();
//        user.setuUserid(uUserid);
//        user.setuPassword(uPassword);
//        user.setuNickname(uNickname);
//        user.setuEmail(uEmail);
//        user.setuName(uName);
//        user.setuWorkplace(uWorkplace);
//        user.setuWorkproperty(uWorkproperty);
//        user.setuSex(uSex);
//        if (user==null){
//            System.out.print(1);}
//        else{
//            System.out.print(user.getuEmail());
//        }
//        userservice.saveUser(user);
//        return Msg.success();
//    }
//    @RequestMapping(value="/reguser",method = RequestMethod.POST)
//    @ResponseBody
//    public Msg saveUser(user user){
//        if (user==null){
//            System.out.print(1);}
//        else{
//            System.out.print(user.toString());
//        }
//        userservice.saveUser(user);
//        return Msg.success();
//    }
}
