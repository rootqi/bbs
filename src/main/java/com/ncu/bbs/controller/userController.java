package com.ncu.bbs.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ncu.bbs.bean.Msg;
import com.ncu.bbs.bean.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

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

    @RequestMapping("/user")
    @ResponseBody
    public Msg getUserWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //这是一个分页查询
        //引入PageHelper分页插件
        //在查询之前调用,传入页码，以及每一页的大小
        PageHelper.startPage(pn,5);
        //分页查询
        List<user> user = userservice.getAll();
        PageInfo page = new PageInfo(user,5);
        return Msg.success().add("pageInfo",page);
    }

//    @RequestMapping("/user")
//    public String getUser(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model) throws JsonProcessingException {
//        //这是一个分页查询
//        //引入PageHelper分页插件
//        //在查询之前调用,传入页码，以及每一页的大小
//        PageHelper.startPage(pn,5);
//        //分页查询
//        List<user> user = userservice.getAll();
//        PageInfo page = new PageInfo(user,5);
//        model.addAttribute("pageInfo",page);
//        HashMap<String, PageInfo> hashMap = new HashMap();
//        hashMap.put("pageInfo",page);
//        ObjectMapper mapper = new ObjectMapper();
//        String jsonStr = mapper.writeValueAsString(hashMap);
//        return jsonStr;
//        return "userlist";
//    }
}
