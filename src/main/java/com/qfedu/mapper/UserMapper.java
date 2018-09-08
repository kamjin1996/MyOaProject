package com.qfedu.mapper;

import com.qfedu.pojo.User;
import com.qfedu.vo.QueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByName(String username);

    List<User> selectUsersByPageAndLimit(@Param("index") int index,@Param("limit") int limit);

    int selectCount();

}