package com.ncu.bbs.dao;

import com.ncu.bbs.bean.reply;
import com.ncu.bbs.bean.replyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface replyMapper {
    long countByExample(replyExample example);

    int deleteByExample(replyExample example);

    int deleteByPrimaryKey(Integer rReplyid);

    int insert(reply record);

    int insertSelective(reply record);

    List<reply> selectByExample(replyExample example);

    reply selectByPrimaryKey(Integer rReplyid);

    int updateByExampleSelective(@Param("record") reply record, @Param("example") replyExample example);

    int updateByExample(@Param("record") reply record, @Param("example") replyExample example);

    int updateByPrimaryKeySelective(reply record);

    int updateByPrimaryKey(reply record);
}