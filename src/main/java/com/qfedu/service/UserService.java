package com.qfedu.service;

import com.qfedu.pojo.User;
import com.qfedu.vo.QueryVo;

import java.util.List;

public interface UserService {

    User queryByName(String username, String password);
    boolean register(User user);

    QueryVo<User> queryAllByPage(int page, int limit);

    boolean add(User user);

    boolean checkName(String username);

    boolean editUserByID(User user);

    boolean updateFlagById(int id);
}
