package com.blog.controller;

import com.blog.Util.Result;
import com.blog.model.Tag;
import com.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author: Yang Yezhuang
 * @date: 2022/3/17 15:16
 */
@RestController
@RequestMapping("/tags")
public class TagController {

    @Autowired
    TagService tagService;

    /**
     * 获取全部tag
     *
     * @return
     */
    @GetMapping("")
    public Result getTag() {
        List<Tag> tags = tagService.getTag();
        return Result.success(tags);
    }

    /**
     * 添加标签
     *
     * @param tag
     * @return
     */
    @PostMapping("/add/{tag}")
    public Result addTag(@PathVariable("tag") String tag) {
        return Result.success(tagService.addTag(tag));
    }

    /**
     * 删除标签
     *
     * @param tag
     * @return
     */
    @DeleteMapping("/del/{tag}")
    public Result delTag(@PathVariable("tag") String tag) {
        return Result.success(tagService.delTag(tag));
    }

}
