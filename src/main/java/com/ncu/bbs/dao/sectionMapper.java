package com.ncu.bbs.dao;

import com.ncu.bbs.bean.section;
import com.ncu.bbs.bean.sectionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface sectionMapper {
    long countByExample(sectionExample example);

    int deleteByExample(sectionExample example);

    int deleteByPrimaryKey(Integer sId);

    int insert(section record);

    int insertSelective(section record);

    List<section> selectByExample(sectionExample example);

    section selectByPrimaryKey(Integer sId);

    int updateByExampleSelective(@Param("record") section record, @Param("example") sectionExample example);

    int updateByExample(@Param("record") section record, @Param("example") sectionExample example);

    int updateByPrimaryKeySelective(section record);

    int updateByPrimaryKey(section record);
}