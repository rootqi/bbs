package com.ncu.bbs.services.impl;

import com.ncu.bbs.bean.main;
import com.ncu.bbs.bean.mainExample;
import com.ncu.bbs.dao.mainMapper;
import com.ncu.bbs.services.mainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;

import java.util.List;

@Service("mainService")
@ContextConfiguration("classpath:applicationContext.xml")
public class mainServiceImp implements mainService {

    @Autowired
    private mainMapper mainmapper;

    @Override
    public long countByExample(mainExample example) {
        return 0;
    }

    @Override
    public int deleteByExample(mainExample example) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey(Integer mMainid) {
        return 0;
    }

    @Override
    public int insert(main record) {
        return 0;
    }

    @Override
    public int insertSelective(main record) {
        return 0;
    }

    @Override
    public List<main> selectByExample(mainExample example) {
        return null;
    }

    @Override
    public main selectByPrimaryKey(Integer mMainid) {
        return null;
    }

    @Override
    public int updateByExampleSelective(main record, mainExample example) {
        return 0;
    }

    @Override
    public int updateByExample(main record, mainExample example) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(main record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(main record) {
        return 0;
    }

    @Override
    public List<main> getAll() {
        return mainmapper.selectByExample(null);
    }

    @Override
    public void deleteMain(Integer mMainid) {
        mainmapper.deleteByPrimaryKey(mMainid);
    }
}
