package com.blog.mapper;

import com.blog.model.Article;
import com.blog.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface UserMapper {

    @Select("select * from user_tbl where username=#{username};")
    User findUser(String username);

    @Select("select * from user_tbl;")
    List<User> queryAllUser();

    @Insert("INSERT INTO user_tbl (id,username,password) VALUES(#{uid},#{username},#{password});")
    int insertUser(long uid, String username, String password);

    @Delete("DELETE FROM user_tbl WHERE id=#{uid};")
    int deleteUser(long uid);

    @Select("")
    User queryInfo(long uid);

    @Update("")
    int updateInfo(long uid, String username, String password);

}
