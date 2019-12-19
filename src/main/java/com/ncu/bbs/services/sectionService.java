package com.ncu.bbs.services;

import com.ncu.bbs.bean.section;
import com.ncu.bbs.bean.sectionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface sectionService {

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

    List<section> getAll();

    void deleteSection(Integer sId);

    section getSection(Integer sId);

    void updatesection(section section);
}
