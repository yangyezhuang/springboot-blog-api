package com.blog.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * @author: Yang Yezhuang
 * @date: 2022/4/20
 */
@Mapper
public interface PvMapper {
    @Select("select views from article_pv_tbl where id=#{id};")
    long queryById(long id);

    @Update("update article_pv_tbl set views=views+1 where id = #{id};")
    int updateViews(long id);
}
