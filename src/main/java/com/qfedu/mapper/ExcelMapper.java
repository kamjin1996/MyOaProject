package com.qfedu.mapper;

import com.qfedu.pojo.Department;
import com.qfedu.pojo.User;
import com.qfedu.pojo.UserDepartment;
import com.qfedu.vo.ExcelVo;

import java.util.List;

public interface ExcelMapper {

    List<ExcelVo> selectExcel();

    int insertUsers(List<User> users);

    int insertDeps(List<Department> departments);

    int insertUserDeps(List<UserDepartment> userDepartments);

}
