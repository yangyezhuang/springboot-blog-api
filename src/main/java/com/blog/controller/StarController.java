package com.blog.controller;

import com.blog.service.StarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author: Yang Yezhuang
 * @date: 2022/4/20
 */
@RestController
@RequestMapping("/star")
public class StarController {

    @Autowired
    StarService starService;

    /**
     * 获取点赞数量
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public long getStar(@PathVariable("id") long id) {
        return starService.getStar(id);
    }

    /**
     * 更新点赞数据量
     *
     * @param id
     * @return
     */
    @PutMapping("/{id}")
    public int updateStar(@PathVariable("id") long id) {
        return starService.updateStar(id);
    }
}
