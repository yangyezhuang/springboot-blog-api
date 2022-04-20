package com.blog.service;

import com.blog.mapper.PvMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: Yang Yezhuang
 * @date: 2022/4/20
 */
@Service
public class PvService {

    @Autowired
    PvMapper pvMapper;

    public long getPV(long id) {
        return pvMapper.queryById(id);
    }

    public int updatePV(long id) {
        return pvMapper.updateViews(id);
    }
}
