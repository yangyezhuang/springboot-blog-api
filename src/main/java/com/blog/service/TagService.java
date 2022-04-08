package com.blog.service;

import com.blog.mapper.TagMapper;
import com.blog.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: TODO
 * @Date: 2022/3/17 13:27
 * @Author: Yang Yezhuang
 */
@Service
public class TagService {

    @Autowired
    private TagMapper tagMapper;


    public int addTag(String tag) {
        return tagMapper.insertTag(tag);
    }

    public int delTag(String tag) {
        return tagMapper.deleteTag(tag);
    }

    public List<Tag> getTag() {
        return tagMapper.selectTag();
    }
}
