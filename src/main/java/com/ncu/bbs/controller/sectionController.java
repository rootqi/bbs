package com.ncu.bbs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ncu.bbs.bean.Msg;
import com.ncu.bbs.bean.main;
import com.ncu.bbs.bean.section;
import com.ncu.bbs.bean.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class sectionController {

    @Autowired
    com.ncu.bbs.services.sectionService sectionservice;

    @RequestMapping(value = "/saveBanzhuid",method = RequestMethod.POST)
    @ResponseBody
    public Msg updateBanzhuid(HttpServletRequest request){
        section section = new section();
        Object sBanzhuid = request.getParameter("sBanzhuid");
        Integer ssBanzhuid = (Integer) sBanzhuid;
        Object sId = request.getParameter("sId");
        Integer ssId = (Integer) sId;
        section.setsBanzhuid(ssBanzhuid);
        section.setsId(ssId);
        if(sBanzhuid==null){
            System.out.print(1);
        }else{
            System.out.print(2);
        System.out.println(sBanzhuid);
        System.out.println(sId);
        System.out.println(ssBanzhuid);
        System.out.println(ssId);}
        sectionservice.updatesection(section);
        return Msg.success();
    }

//    @RequestMapping(value = "/section/{sId}",method = RequestMethod.PUT)
//    @ResponseBody
//    public Msg saveBanzhuid(section section){
//        System.out.println(section.getsId());
//        System.out.println(section.getsBanzhuid());
//        sectionservice.updatesection(section);
//        return Msg.success();
//    }

    @RequestMapping(value="/section/{sId}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getSection(@PathVariable("sId")Integer sId){
        section section = sectionservice.getSection(sId);
        return Msg.success().add("section",section);
    }

    @RequestMapping("/section")
    @ResponseBody
    public Msg getSectionWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //这是一个分页查询
        //引入PageHelper分页插件
        //在查询之前调用,传入页码，以及每一页的大小
        PageHelper.startPage(pn,5);
        //分页查询
        List<section> section = sectionservice.getAll();
        PageInfo<section> page = new PageInfo<>(section,5);
        return Msg.success().add("pageInfo",page);
    }

    @RequestMapping(value="/sections/{sId}",method = RequestMethod.DELETE)
    public Msg deleteEmById(@PathVariable("sId")Integer sId){
        sectionservice.deleteSection(sId);
        return Msg.success();
    }
}
