package com.blog.controller;

import com.blog.service.PvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author: Yang Yezhuang
 * @date: 2022/4/20
 */
@RestController
@RequestMapping("/pv")
public class PvController {

    @Autowired
    PvService pvService;

    /**
     * 获取访问量
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public long getPV(@PathVariable("id") long id) {
        return pvService.getPV(id);
    }

    /**
     * 更新访问量
     *
     * @param id
     * @return
     */
    @PutMapping("/{id}")
    public int updatePV(@PathVariable("id") long id) {
        return pvService.updatePV(id);
    }
}
