package com.blog.service;

import com.blog.mapper.UserMapper;
import com.blog.model.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Yang Yezhuang
 * @date: 2022/3/17
 */
@Slf4j
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 用户登录
     *
     * @param username
     * @return
     */
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

    /**
     * 获取全部用户
     *
     * @return
     */
    public List<User> listUsers() {
        return userMapper.queryAllUser();
    }

    /**
     * 添加用户
     *
     * @param user
     * @return
     */
    public int insertUser(User user) {
        // 10位数的时间戳
        long uid = System.currentTimeMillis() / 1000;
        String username = user.getUsername();
        String password = user.getPassword();

        return userMapper.insertUser(uid, username, password);
    }

    /**
     * 删除指定用户
     *
     * @param uid
     * @return
     */
    public int deleteUser(long uid) {
        return userMapper.deleteUser(uid);
    }

    /**
     * 获取用户信息
     *
     * @param uid
     * @return
     */
    public User getUserInfo(long uid) {
        return userMapper.queryInfo(uid);
    }

    /**
     * 关系用户信息
     *
     * @param user
     * @return
     */
    public int updateUserInfo(User user) {
        long uid = user.getId();
        String username = user.getUsername();
        String password = user.getPassword();

        return userMapper.updateInfo(uid, username, password);
    }

}
