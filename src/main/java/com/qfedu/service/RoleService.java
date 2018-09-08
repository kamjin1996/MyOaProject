package com.qfedu.service;

import com.qfedu.pojo.Role;
import com.qfedu.pojo.User;
import com.qfedu.vo.QueryVo;

import java.util.List;

public interface RoleService {

    QueryVo<Role> queryAllByPage(int page, int limit);

    boolean save(Role role);

    List<Role> queryAll();

    List<Role> queryByUid(int uid);

    int updateUserRoleByUid(int uid, Integer[] rid);

    int updateRoleById(Role role);

    int updataFlagById(int id);
}
