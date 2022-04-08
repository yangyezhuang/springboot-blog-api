package com.blog.mapper;

import com.blog.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @Description: TODO
 * @Date: 2022/3/17 15:16
 * @Author: Yang Yezhuang
 */
@Mapper
public interface UserMapper {

    @Select("select * from user_tbl where username=#{username};")
    User findUser(String username);
}
