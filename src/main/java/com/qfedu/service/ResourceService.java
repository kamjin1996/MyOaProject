package com.qfedu.service;

import com.qfedu.pojo.Resource;
import com.qfedu.vo.MenuVo;
import com.qfedu.vo.QueryVo;

import java.util.List;

public interface ResourceService {
    //左侧菜单栏资源的获取
    List<MenuVo> queryLeftMenus();
    //资源列表
    QueryVo<Resource> queryByPage(int page, int limit);

    boolean save(Resource resource);

    List<Resource> initFirstMenu();

    //根据用户查询对应的权限
    List<Resource> selectByUid(Integer uid);

    List<Resource> selectAll();

    List<Resource> selectByRid(int rid);

    int updateResourcebyRid(int rid, Integer[] resid);

    int updateResourceById(Resource resource);

    //根据id删权限
    int deleteResById(int id);
}
