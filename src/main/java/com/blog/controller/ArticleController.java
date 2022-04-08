package com.blog.controller;

import com.blog.Util.Result;
import com.blog.model.Article;
import com.blog.service.ArticleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
public class ArticleController {

    @Autowired
    private ArticleService articleService;


    /**
     * 获取全部文章
     *
     * @return
     */
    @GetMapping("/articles")
    public Result findAll() {
        List<Article> articles = articleService.findAll();
        //log.info("articles" + articles);
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
        //log.info("detail" + detail);
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
        //log.info("articles" + articles);
        return Result.success(articles);
    }


    /**
     * 根据类别获取
     *
     * @param tag
     * @return
     */
    @GetMapping("/articles/{tag}")
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
    @GetMapping("/Archives")
    public Result findByTag() {
        List<Article> articles = articleService.findByYear();
        return Result.success(articles);
    }

    /**
     * 添加文章
     *
     * @return
     */
    @PostMapping("/create")
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
    @PostMapping(value = "/del/{id}")
    public Result delArticle(@PathVariable("id") int id) {
        articleService.delArticle(id);

        return Result.success();
    }
}
