package com.qfedu.shrio;


import com.qfedu.pojo.Resource;
import com.qfedu.pojo.User;
import com.qfedu.service.ResourceService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.List;

public class UserRealm extends AuthorizingRealm {
    //将当前用户拥有的权限统统存在集合info内，前端传来的权限请求会进行匹配，有与否用0|1表示
    //这里因为realm使用的是xml的方式配置的，所以让realm使用spring的bean的话，需在xml中配置
    private ResourceService resourceService;

    public ResourceService getResourceService() {
        return resourceService;
    }

    public void setResourceService(ResourceService resourceService) {
        this.resourceService = resourceService;
    }

    //
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //权限集合info
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //查询当前用户的所有拥有权限
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
        List<Resource> resources = resourceService.selectByUid(user.getId());
        //遍历权限集合，存入info中
        for(Resource re : resources){
            info.addStringPermission(re.getPer());
        }
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //1、获取令牌
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        //2、外界已经进行过登录校验，此处只需要进行对象封装
        if (token.getUsername().length() > 0) {
            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(token.getUsername(), token.getPassword(), getName());
            //3、存储到Session  （此步已在controller完成，也可选择在此完成）  //SecurityUtils.getSubject().getSession().setAttribute("username",token.getUsername());
            return info;
        }
        return null;
    }
}
