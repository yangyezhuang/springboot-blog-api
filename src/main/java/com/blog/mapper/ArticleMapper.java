package com.blog.mapper;

import com.blog.model.Article;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ArticleMapper {

    // 获取全部文章
    @Select("select * from article_tbl;")
    List<Article> findAll();

    //查看文章详情
    @Select("select title,date,content,tag from article_tbl where id=#{id};")
    Article findById(int id);

    // 搜索相关文章
    @Select("select * from article_tbl where title like CONCAT('%',#{keyword},'%');")
    List<Article> queryByKeyword(String keyword);

    // 查看与tag相关的文章
    @Select("select * from article_tbl where tag=#{tag};")
    List<Article> findByTag(String tag);



    // 以时间进行归档
    @Select("select date,title,tag,year from article_tbl group by year;")
    List<Article> findByYear();

    // 添加文章
    @Insert("insert into article_tbl (id,title,content,tag,date,year,month)" +
            "values(#{id},#{title},#{content},#{tag},#{date},#{year},#{month});")
    int insert(long id, String title, String content, String tag, String date, int year, int month);

    // 修改文章
    @Insert("UPDATE article_tbl SET title=#{title},content=#{content},tag=#{tag}," +
            "date=#{date},year=#{year},month=#{month} WHERE id=#{id};")
    int update(long id, String title, String content, String tag, String date, int year, int month);

    // 删除文章
    @Delete("DELETE FROM article_tbl WHERE id=#{id};")
    int delArticle(int id);

}
