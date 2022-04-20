package com.blog.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * @author: Yang Yezhuang
 * @date: 2022/4/20
 */
@Mapper
public interface StarMapper {

    @Select("select star from article_star_tbl where id=#{id};")
    long queryById(long id);

    @Update("update article_star_tbl set star=star+1 where id = #{id};")
    int updateStar(long id);


}
