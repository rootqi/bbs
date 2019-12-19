package com.ncu.bbs.dao;

import com.ncu.bbs.bean.administrator;
import com.ncu.bbs.bean.administratorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;

@Repository
@ContextConfiguration("classpath:applicationContext.xml")
public interface administratorMapper {
    long countByExample(administratorExample example);

    int deleteByExample(administratorExample example);

    int deleteByPrimaryKey(Integer aId);

    int insert(administrator record);

    int insertSelective(administrator record);

    List<administrator> selectByExample(administratorExample example);

    administrator selectByPrimaryKey(Integer aId);

    int updateByExampleSelective(@Param("record") administrator record, @Param("example") administratorExample example);

    int updateByExample(@Param("record") administrator record, @Param("example") administratorExample example);

    int updateByPrimaryKeySelective(administrator record);

    int updateByPrimaryKey(administrator record);

}