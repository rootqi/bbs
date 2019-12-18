package com.ncu.bbs.services;

import com.ncu.bbs.bean.main;
import com.ncu.bbs.bean.mainExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface mainService {
    long countByExample(mainExample example);

    int deleteByExample(mainExample example);

    int deleteByPrimaryKey(Integer mMainid);

    int insert(main record);

    int insertSelective(main record);

    List<main> selectByExample(mainExample example);

    main selectByPrimaryKey(Integer mMainid);

    int updateByExampleSelective(@Param("record") main record, @Param("example") mainExample example);

    int updateByExample(@Param("record") main record, @Param("example") mainExample example);

    int updateByPrimaryKeySelective(main record);

    int updateByPrimaryKey(main record);

    List<main> getAll();

    void deleteMain(Integer mMainid);
}
