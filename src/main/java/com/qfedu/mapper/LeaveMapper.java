package com.qfedu.mapper;

import com.qfedu.pojo.Leave;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LeaveMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Leave record);

    int insertSelective(Leave record);

    Leave selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Leave record);

    int updateByPrimaryKey(Leave record);


    List<Leave> selectByPage(@Param("index") int index, @Param("count") int count);
    int selectCount();

    int updateFlag(@Param("id")int id, @Param("flag")int flag);

    List<Leave> selectByUid(int uid);

    List<Leave> selectAll();

}