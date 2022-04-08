package com.blog.service;

import com.blog.mapper.UserMapper;
import com.blog.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description: TODO
 * @Date: 2022/3/17 15:17
 * @Author: Yang Yezhuang
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public User login(String username) {
        //String username = user.getUsername();
        //String password = user.getPassword();

        User user = userMapper.findUser(username);
        return user;

        //if (u.getUsername().equals(username) && u.getPassword().equals(password)) {
        //    return Result.success(ResultCode.SUCCESS, "登陆成功");
        //} else {
        //    return Result.failure(ResultCode.FAILURE, "账号或密码错误");
        //}
    }
}
