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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description: TODO
 * @Date: 2022/3/17 15:16
 * @Author: Yang Yezhuang
 */
@Slf4j
@RestController
public class UserController {

    @Autowired
    UserService userService;

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
            //json.put("role", role);
            //json.put("token", uToken);

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
}
