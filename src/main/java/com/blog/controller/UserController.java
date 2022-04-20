package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.blog.Util.Result;
import com.blog.Util.ResultCode;
import com.blog.model.User;
import com.blog.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author: Yang Yezhuang
 * @date: 2022/3/17 15:16
 */
@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 用户登录
     *
     * @param user
     * @return
     */
    @PostMapping("/login")
    public Result login(@RequestBody User user) {
        String username = user.getUsername();
        String password = user.getPassword();

        // 获取当前用户
        Subject subject = SecurityUtils.getSubject();
        // 封装用户登陆数据
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 使用shiro进行登录验证
        try {
            subject.login(token);
            log.info("subject.getPrincipal:" + subject.getPrincipal());
            //获取token
            //String uToken = JWTUtils.getToken(user);
            // 获取权限角色
            //String role = userService.queryRole(user.getUid()).getRole();
            // 封装返回体
            JSONObject json = new JSONObject();
            json.put("id", user.getId());
            json.put("username", user.getUsername());
            // json.put("role", role);
            // json.put("token", uToken);

            log.info("json" + json);

            //返回给客户端保存
            return Result.success(json);
        } catch (UnknownAccountException e) { // 账号错误
            log.info("账号错误");
            return Result.failure(ResultCode.FAILURE, "账号错误");

        } catch (IncorrectCredentialsException e) {// 密码错误
            log.info("密码错误");
            return Result.failure(ResultCode.FAILURE, "密码错误");
        }
    }

    /**
     * 用户注册
     *
     * @param user
     * @return
     */
    @PostMapping("/register")
    public int register(@RequestBody User user) {
        return userService.insertUser(user);
    }

    /**
     * 获取全部用户
     *
     * @return
     */
    @GetMapping("/list")
    public List<User> userList() {
        return userService.listUsers();
    }

    /**
     * 管理员身份添加用户
     *
     * @param user
     * @return
     */
    @PostMapping("/add")
    public int insertUser(@RequestBody User user) {
        return userService.insertUser(user);
    }

    /**
     * 删除用户
     *
     * @param uid
     * @return
     */
    @DeleteMapping("/del/{uid}")
    public int deleteUser(@PathVariable("uid") long uid) {
        return userService.deleteUser(uid);
    }

    /**
     * 获取用户信息
     *
     * @param uid
     * @return
     */
    @GetMapping("/info/{uid}")
    public User getUserInfo(@PathVariable("uid") long uid) {
        return userService.getUserInfo(uid);
    }

    /**
     * 更新用户信息
     *
     * @param user
     * @return
     */
    @PutMapping("/update")
    public int updateUserInfo(@RequestBody User user) {
        return userService.updateUserInfo(user);
    }

}
