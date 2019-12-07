package com.ncu.bbs.dao;

import com.ncu.bbs.bean.follow;
import com.ncu.bbs.bean.followExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface followMapper {
    long countByExample(followExample example);

    int deleteByExample(followExample example);

    int deleteByPrimaryKey(Integer fFollowid);

    int insert(follow record);

    int insertSelective(follow record);

    List<follow> selectByExample(followExample example);

    follow selectByPrimaryKey(Integer fFollowid);

    int updateByExampleSelective(@Param("record") follow record, @Param("example") followExample example);

    int updateByExample(@Param("record") follow record, @Param("example") followExample example);

    int updateByPrimaryKeySelective(follow record);

    int updateByPrimaryKey(follow record);
}