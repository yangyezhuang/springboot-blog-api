package com.blog.controller;

import com.blog.Util.Result;
import com.blog.model.Article;
import com.blog.service.ArticleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author: Yang Yezhuang
 * @date: 2022/3/17 15:16
 */
@Slf4j
@RestController
@RequestMapping("/articles")
public class ArticleController {

    @Autowired
    private ArticleService articleService;


    /**
     * 获取全部文章
     *
     * @return
     */
    @GetMapping("")
    public Result findAll() {
        List<Article> articles = articleService.findAll();
        return Result.success(articles);
    }


    /**
     * 查看文章详情
     *
     * @param id
     * @return
     */
    @GetMapping("/article/{id}")
    public Result findById(@PathVariable("id") int id) {
        Article detail = articleService.findById(id);
        return Result.success(detail);
    }


    /**
     * 搜索相关文章
     *
     * @param keyword
     * @return
     */
    @GetMapping("/search/{keyword}")
    public Result queryByTitle(@PathVariable("keyword") String keyword) {
        List<Article> articles = articleService.queryByKeyword(keyword);
        return Result.success(articles);
    }


    /**
     * 根据类别获取
     *
     * @param tag
     * @return
     */
    @GetMapping("/{tag}")
    public Result findAll(@PathVariable("tag") String tag) {
        List<Article> articles = articleService.findByTag(tag);
        return Result.success(articles);
    }


    /**
     * 查看与tag相关的文章
     *
     * @param tag
     * @return
     */
    @GetMapping("/category/{tag}")
    public Result findByTag(@PathVariable("tag") String tag) {
        List<Article> articles = articleService.findByTag(tag);
        return Result.success(articles);
    }

    /**
     * 以时间进行归档
     *
     * @return
     */
    @GetMapping("/archive")
    public Result findByTag() {
        List<Article> articles = articleService.findByYear();
        return Result.success(articles);
    }

    /**
     * 获取用户发布的文章
     *
     * @param uid
     * @return
     */
    @GetMapping("/{uid}/articles")
    public List<Article> userArticles(@PathVariable("uid") int uid) {
        return articleService.listUserArticles(uid);
    }




    /**
     * 添加文章
     *
     * @return
     */
    @PostMapping("/write")
    public Result insert(@RequestBody Article article) {
        articleService.insert(article);
        return Result.success();
    }


    /**
     * 修改文章
     */
    @PostMapping("/update")
    public Result updateArticle(@RequestBody Article article) {
        articleService.update(article);
        return Result.success();
    }


    /**
     * 删除文章
     */
    @DeleteMapping(value = "/delete/{id}")
    public Result delArticle(@PathVariable("id") int id) {
        articleService.delArticle(id);

        return Result.success();
    }
}
