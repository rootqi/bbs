package com.ncu.bbs.services;

import com.ncu.bbs.bean.user;
import com.ncu.bbs.bean.userExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface userService {
    long countByExample(userExample example);

    int deleteByExample(userExample example);

    int deleteByPrimaryKey(Integer uId);

    int insert(user record);

    int insertSelective(user record);

    List<user> selectByExample(userExample example);

    user selectByPrimaryKey(Integer uId);

    int updateByExampleSelective(@Param("record") user record, @Param("example") userExample example);

    int updateByExample(@Param("record") user record, @Param("example") userExample example);

    int updateByPrimaryKeySelective(user record);

    int updateByPrimaryKey(user record);

    void saveUser(user user);

    boolean checkuUserid(String uUserid);
}
