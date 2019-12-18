package com.ncu.bbs.services.impl;

import com.ncu.bbs.bean.main;
import com.ncu.bbs.bean.mainExample;
import com.ncu.bbs.bean.section;
import com.ncu.bbs.bean.sectionExample;
import com.ncu.bbs.dao.mainMapper;
import com.ncu.bbs.dao.sectionMapper;
import com.ncu.bbs.services.sectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;

import java.util.List;

@Service("mainService")
@ContextConfiguration("classpath:applicationContext.xml")
public class sectionServiceImp implements sectionService {

    @Autowired
    private sectionMapper sectionmapper;

    @Override
    public long countByExample(sectionExample example) {
        return 0;
    }

    @Override
    public int deleteByExample(sectionExample example) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey(Integer sId) {
        return 0;
    }

    @Override
    public int insert(section record) {
        return 0;
    }

    @Override
    public int insertSelective(section record) {
        return 0;
    }

    @Override
    public List<section> selectByExample(sectionExample example) {
        return null;
    }

    @Override
    public section selectByPrimaryKey(Integer sId) {
        return null;
    }

    @Override
    public int updateByExampleSelective(section record, sectionExample example) {
        return 0;
    }

    @Override
    public int updateByExample(section record, sectionExample example) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(section record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(section record) {
        return 0;
    }

    @Override
    public List<section> getAll() {
        return sectionmapper.selectByExample(null);
    }

    @Override
    public void deleteSection(Integer sId) {
        sectionmapper.deleteByPrimaryKey(sId);
    }
}
