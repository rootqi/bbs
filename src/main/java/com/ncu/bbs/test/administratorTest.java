package com.ncu.bbs.test;

import com.ncu.bbs.bean.administrator;
import com.ncu.bbs.dao.administratorMapper;
import com.ncu.bbs.services.impl.AdministratorServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)

public class administratorTest {
    @Autowired
    AdministratorServiceImpl administratorService;
    @Autowired
    com.ncu.bbs.dao.administratorMapper administratorMapper;
    @Test
    public void insertAdministrator(){
        administrator administrator=new administrator();
        administrator.setaAdminname("aaa");
        administrator.setaEmail("bbb");
        administrator.setaHeadpic("ccc");
        administrator.setaPassword("ddd");
        administratorService.insertAdministrator(administrator);
}
    @Test
    public void  selectAllAdministrator(){
        List<administrator> list=administratorService.selectAllAdministrator();
        administratorMapper.deleteByPrimaryKey(1);
        System.out.println(list.get(1));
    }
}
