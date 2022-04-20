package com.blog.controller;

import com.blog.model.Article;
import com.blog.service.CollectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author: Yang Yezhuang
 * @date: 2022/4/19
 */
@Slf4j
@RestController
@RequestMapping("/collect")
public class CollectController {

    @Autowired
    CollectService collectService;

    /**
     * 获取用户收藏的文章
     *
     * @param uid
     * @return
     */
    @GetMapping("/{uid}")
    public List<Article> getUserCollect(@PathVariable("uid") long uid) {
        return collectService.listUserCollect(uid);
    }

    /**
     * 添加收藏
     *
     * @param uid
     * @param article_id
     * @return
     */
    @PostMapping("/{uid}/article/{article_id}")
    public int insertCollect(@PathVariable("uid") long uid,
                             @PathVariable("article_id") long article_id) {
        return collectService.insertCollect(uid, article_id);
    }

    /**
     * 取消收藏
     *
     * @param uid
     * @param article_id
     * @return
     */
    @DeleteMapping("/{uid}/article/{article_id}")
    public int deleteCollect(@PathVariable("uid") long uid,
                             @PathVariable("article_id") long article_id) {
        return collectService.deleteCollect(uid, article_id);
    }

}
