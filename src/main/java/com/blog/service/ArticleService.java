package com.blog.service;

import com.blog.mapper.ArticleMapper;
import com.blog.model.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class ArticleService {

    @Autowired
    private ArticleMapper articleMapper;


    // 获取全部文章
    public List<Article> findAll() {
        return articleMapper.findAll();
    }

    //查看文章详情
    public Article findById(int id) {
        return articleMapper.findById(id);
    }

    // 搜索相关文章
    public List<Article> queryByKeyword(String keyword) {
        return articleMapper.queryByKeyword(keyword);
    }

    // 查看与tag相关的文章
    public List<Article> findByTag(String tag) {
        return articleMapper.findByTag(tag);
    }

    // 以时间归档
    public List<Article> findByYear() {
        return articleMapper.findByYear();
    }

    // 添加文章
    public int insert(Article article) {
        long id = System.currentTimeMillis() / 1000; // 生成时间戳
        String title = article.getTitle();
        String content = article.getContent();
        String tag = article.getTag();

        // 格式化时间
        Date nowDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = dateFormat.format(nowDate);
        // 获取年份，月份
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);

        return articleMapper.insert(id, title, content, tag, date, year, month);
    }

    // 修改文章
    public int update(Article article) {
        long id = article.getId();
        String title = article.getTitle();
        String content = article.getContent();
        String tag = article.getTag();

        // 格式化时间
        Date nowDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = dateFormat.format(nowDate);
        // 获取年份，月份
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);

        return articleMapper.update(id, title, content, tag, date, year, month);
    }

    // 删除文章
    public int delArticle(int id) {
        return articleMapper.delArticle(id);
    }
}


