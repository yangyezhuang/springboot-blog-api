package com.blog.mapper;

import com.blog.model.Tag;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface TagMapper {

    // 新增tag
    @Insert("insert into tag_tbl (tag) values(#{tag});")
    int insertTag(String tag);

    // 删除tag
    @Delete("delete from tag_tbl where tag = #{tag};")
    int deleteTag(String tag);

    // 获取全部tag
    @Select("select tag from tag_tbl;")
    List<Tag> selectTag();
}
