package com.ncu.bbs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ncu.bbs.bean.Msg;
import com.ncu.bbs.bean.main;
import com.ncu.bbs.bean.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class userController {

    @Autowired
    com.ncu.bbs.services.userService userservice;

    @RequestMapping("/user")
    @ResponseBody
    public Msg getUserWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //这是一个分页查询
        //引入PageHelper分页插件
        //在查询之前调用,传入页码，以及每一页的大小
        PageHelper.startPage(pn,5);
        //分页查询
        List<user> user = userservice.getAll();
        PageInfo<com.ncu.bbs.bean.user> page = new PageInfo<>(user,5);
        return Msg.success().add("pageInfo",page);
    }

    @RequestMapping(value="/users/{uId}",method = RequestMethod.DELETE)
    public Msg deleteEmById(@PathVariable("uId")Integer uId){
        userservice.deleteUser(uId);
        return Msg.success();
    }

    /**
     * 用户注册信息保存
     * @param
     * @return
     */

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
     * @param
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
}
