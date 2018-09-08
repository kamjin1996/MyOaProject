package com.qfedu.service.impl;

import com.qfedu.mapper.RoleMapper;
import com.qfedu.pojo.Role;
import com.qfedu.service.RoleService;
import com.qfedu.vo.QueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;


    @Override
    public QueryVo<Role> queryAllByPage(int page, int limit) {
        int index = 0;
        if (page > 0) {
            index = (page - 1) * limit;
        }
        return QueryVo.createPage(roleMapper.selectCount(), roleMapper.selectByPage(index, limit));
    }

    @Override
    public boolean save(Role role) {

        return roleMapper.insert(role)>0;
    }

    @Override
    public List<Role> queryAll() {
        return roleMapper.selectAll();
    }

    @Override
    public List<Role> queryByUid(int uid) {
        return roleMapper.selectByUid(uid);
    }

    @Override
    public int updateUserRoleByUid(int uid, Integer[] rid) {
        roleMapper.deleteRoleByUid(uid);
        if(rid!=null&&rid[0]!=0){
            return roleMapper.insertRoleByUid(uid,rid);
        }
       return 0;
    }

    @Override
    public int updateRoleById(Role role) {
        return roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public int updataFlagById(int id) {
        return roleMapper.updateFlagTo1ById(id);
    }
}
