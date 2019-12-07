package com.ncu.bbs.services.impl;

import com.ncu.bbs.bean.administrator;
import com.ncu.bbs.bean.administratorExample;
import com.ncu.bbs.dao.administratorMapper;
import com.ncu.bbs.services.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;

import java.util.List;

@Service("AdministratorService")
@ContextConfiguration("classpath:applicationContext.xml")
public class AdministratorServiceImpl implements AdministratorService {
    @Autowired
    administratorMapper administratorMapper;
    public void insertAdministrator(administrator administrator) {
        administratorMapper.insert(administrator);
    }

    public List<administrator> selectAllAdministrator() {
        List<administrator> list=administratorMapper.selectByExample(null);
        return list;
    }
}
