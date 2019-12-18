package com.ncu.bbs.services.impl;

import com.ncu.bbs.bean.user;
import com.ncu.bbs.bean.userExample;
import com.ncu.bbs.dao.userMapper;
import com.ncu.bbs.services.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service("userService")
@ContextConfiguration("classpath:applicationContext.xml")
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

    /**
     * 用户保存方法
     * @param
     */
    @Override
    public void saveUser(user user) {
        usermapper.insertSelective(user);
    }

    /**
     * 检验用户账号是否可用
     * @param
     * @return  true代表当前账号可用 false代表不可用
     */
    public boolean checkuUserid(String uUserid){
        userExample example = new userExample();
        userExample.Criteria criteria = example.createCriteria();
        criteria.andUUseridEqualTo(uUserid);
        long count = usermapper.countByExample(example);
        return count==0;
    }

    /**
     * 查询所有用户
     * @return
     */
    @Override
    public List<user> getAll() {
        return usermapper.selectByExample(null);
    }
}
