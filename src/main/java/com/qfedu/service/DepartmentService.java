package com.qfedu.service;

import com.qfedu.pojo.Department;
import com.qfedu.vo.QueryVo;

import java.util.List;

public interface DepartmentService {
    boolean save(Department department);

    QueryVo<Department> queryAllByPage(int page, int limit);

    int updateDepartmentById(Department department);

    List<Department> queryAll();

    List<Department> queryByUid(int uid);

    int updateUserDepartmentByUid(Integer[] did, int uid);

}
