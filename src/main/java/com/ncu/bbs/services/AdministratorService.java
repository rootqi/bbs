package com.ncu.bbs.services;

import com.ncu.bbs.bean.administrator;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;

import java.util.List;
@Service
@ContextConfiguration("classpath:applicationContext.xml")
public interface AdministratorService {
    public void insertAdministrator(administrator administrator);
    public List<administrator> selectAllAdministrator();
    boolean checkaAdminname(String aAdminname);

    boolean checkaPassword(String aPassword);
}
