package com.qfedu.mapper;

import com.qfedu.pojo.UserDepartment;

public interface UserDepartmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserDepartment record);

    int insertSelective(UserDepartment record);

    UserDepartment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserDepartment record);

    int updateByPrimaryKey(UserDepartment record);
}