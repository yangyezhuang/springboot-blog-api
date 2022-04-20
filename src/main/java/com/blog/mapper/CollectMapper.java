package com.blog.mapper;

import com.blog.model.Article;
import com.blog.model.Collect;
import jdk.internal.dynalink.linker.LinkerServices;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author: Yang Yezhuang
 * @date: 2022/4/19
 */
@Mapper
public interface CollectMapper {

    // 获取用户收藏的文章
    @Select("select b.* from user_collect_tbl as a,article_tbl as b where a.article_id=b.id and a.uid=#{uid};")
    List<Article> queryCollectByUid(long uid);

    @Insert("insert into user_collect_tbl (uid,article_id) values(#{uid},#{article_id});")
    int insertCollect(long uid, long article_id);

    @Delete("delete from user_collect_tbl where uid=#{uid} and article_id=#{article_id};")
    int deleteCollect(long uid, long article_id);
}
