package com.ncu.bbs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ncu.bbs.bean.Msg;
import com.ncu.bbs.bean.main;
import com.ncu.bbs.bean.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class mainController {

    @Autowired
    com.ncu.bbs.services.mainService mainservice;

    @RequestMapping("/main")
    @ResponseBody
    public Msg getMainWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //这是一个分页查询
        //引入PageHelper分页插件
        //在查询之前调用,传入页码，以及每一页的大小
        PageHelper.startPage(pn,5);
        //分页查询
        List<main> main = mainservice.getAll();
        PageInfo<main> page = new PageInfo<>(main,5);
        return Msg.success().add("pageInfo",page);
    }

    @RequestMapping(value="/mains/{mMainid}",method = RequestMethod.DELETE)
    public Msg deleteEmById(@PathVariable("mMainid")Integer mMainid){
        mainservice.deleteMain(mMainid);
        return Msg.success();
    }
}
