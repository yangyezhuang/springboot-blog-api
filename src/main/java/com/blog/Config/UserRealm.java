package com.blog.Config;

import com.blog.model.User;
import com.blog.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Description: 自定义的 UserRealm，继承 AuthorizingRealm
 * @Date: 2022/3/17 15:40
 * @Author: Yang Yezhuang
 */
@Slf4j
public class UserRealm extends AuthorizingRealm {

    @Autowired
    UserService userService;

    /**
     * 授权
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addStringPermission("user:add");

        // 拿到当前登录对象
        Subject subject = SecurityUtils.getSubject();
        User currentUser = (User) subject.getPrincipal(); //拿到User对象

        // 设置当前用户权限
        info.addStringPermission(currentUser.getUsername());

        return info;
    }


    /**
     * 认证
     *
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //log.info("执行认证=>doGetAuthorizationInfo");

        UsernamePasswordToken userToken = (UsernamePasswordToken) token;
        // 从数据库中查询用户名，密码
        User user = userService.login(userToken.getUsername());
        //log.info("数据库查询用户名，密码：" + user);

        if (user == null) {
            return null; // 抛出异常 UnknownAccountException
        }

        // 可以加密：MD5，MD5盐值加密
        // 密码认证，shiro做，加密了，无需用户操作
        //return new SimpleAuthenticationInfo(user, user.getPassword(), "");
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), "");
        //log.info("info" + info);

        return info;
    }

}
