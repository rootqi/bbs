package com.ncu.bbs.services.impl;

import com.ncu.bbs.bean.user;
import com.ncu.bbs.bean.userExample;
import com.ncu.bbs.dao.userMapper;
import com.ncu.bbs.services.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class userServiceImp implements userService {

    @Autowired
    private userMapper usermapper;

    @Override
    public long countByExample(userExample example) {
        return 0;
    }

    @Override
    public int deleteByExample(userExample example) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey(Integer uId) {
        return 0;
    }

    @Override
    public int insert(user record) {
        return 0;
    }

    @Override
    public int insertSelective(user record) {
        return 0;
    }

    @Override
    public List<user> selectByExample(userExample example) {
        return null;
    }

    @Override
    public user selectByPrimaryKey(Integer uId) {
        return null;
    }

    @Override
    public int updateByExampleSelective(user record, userExample example) {
        return 0;
    }

    @Override
    public int updateByExample(user record, userExample example) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(user record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(user record) {
        return 0;
    }
}
