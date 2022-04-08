package com.blog.controller;

import com.blog.Util.Result;
import com.blog.model.Tag;
import com.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description: TODO
 * @Date: 2022/3/17 13:32
 * @Author: Yang Yezhuang
 */
@RestController
public class TagController {

    @Autowired
    TagService tagService;

    @PostMapping("/addTag/{tag}")
    public Result addTag(@PathVariable("tag") String tag) {
        return Result.success(tagService.addTag(tag));
    }

    @PostMapping("/delTag/{tag}")
    public Result delTag(@PathVariable("tag") String tag) {
        return Result.success(tagService.delTag(tag));
    }


    /**
     * 获取全部tag
     *
     * @return
     */
    @GetMapping("/getTag")
    public Result getTag() {
        List<Tag> tags = tagService.getTag();
        return Result.success(tags);
    }
}
