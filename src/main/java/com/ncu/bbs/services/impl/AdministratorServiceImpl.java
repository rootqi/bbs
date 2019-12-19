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

    /**
     * 检验用户账号是否可用
     * @param
     * @return  true代表当前账号可用 false代表不可用
     */
    public boolean checkaAdminname(String aAdminname){
        administratorExample example = new administratorExample();
        administratorExample.Criteria criteria = example.createCriteria();
        criteria.andAAdminnameEqualTo(aAdminname);
        long count = administratorMapper.countByExample(example);
        return count==0;
    }

    @Override
    public boolean checkaPassword(String aPassword) {
        administratorExample example = new administratorExample();
        administratorExample.Criteria criteria = example.createCriteria();
        criteria.andAPasswordEqualTo(aPassword);
        long count = administratorMapper.countByExample(example);
        return count==0;
    }


}
