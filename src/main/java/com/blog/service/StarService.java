package com.blog.service;

import com.blog.mapper.StarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: Yang Yezhuang
 * @date: 2022/4/20
 */
@Service
public class StarService {

    @Autowired
    StarMapper starMapper;

    public long getStar(long id) {
        return starMapper.queryById(id);
    }

    public int updateStar(long id) {
        return starMapper.updateStar(id);
    }

}
