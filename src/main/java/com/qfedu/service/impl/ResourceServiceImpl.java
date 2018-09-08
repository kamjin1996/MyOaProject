package com.qfedu.service.impl;

import com.qfedu.mapper.ResourceMapper;
import com.qfedu.pojo.Resource;
import com.qfedu.service.ResourceService;
import com.qfedu.vo.MenuVo;
import com.qfedu.vo.QueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;
    //左菜单准备
    @Override
    public List<MenuVo> queryLeftMenus() {
        return MenuVo.createMenuList(resourceMapper.selectAll());
    }
    //资源列表
    @Override
    public QueryVo<Resource> queryByPage(int page, int limit){
        int index = 0;
        if(page>0){
            index = (page-1)*limit;
        }
        return QueryVo.createPage(resourceMapper.selectCount(),resourceMapper.selectByPage(index,limit));
    }

    @Override
    public boolean save(Resource resource) {
        return resourceMapper.insert(resource)>0;
    }

    @Override
    public List<Resource> initFirstMenu() {
        return resourceMapper.selectAllFirstMenu();
    }

    @Override
    public List<Resource> selectByUid(Integer uid) {
        return resourceMapper.selectByUid(uid);
    }

    @Override
    public List<Resource> selectAll() {
        return resourceMapper.selectAll();
    }

    @Override
    public List<Resource> selectByRid(int rid) {
        return resourceMapper.selectResourceByRidAtRR(rid);
    }

    @Override
    public int updateResourcebyRid(int rid, Integer[] resid) {
        resourceMapper.deleteResoucrceByRid(rid);
        if(resid!=null&&resid[0]!=0){
            return resourceMapper.insertResourceByResid(rid,resid);
        }
        return 0;
    }

    @Override
    public int updateResourceById(Resource resource) {

        return resourceMapper.updateByPrimaryKeySelective(resource);
    }

    @Override
    public int deleteResById(int id) {
        return resourceMapper.deleteByPrimaryKey(id);
    }

}
