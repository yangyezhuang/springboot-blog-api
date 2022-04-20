package com.blog.service;

import com.blog.mapper.TagMapper;
import com.blog.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Yang Yezhuang
 * @date: 2022/3/17 15:16
 */
@Service
public class TagService {

    @Autowired
    private TagMapper tagMapper;

    /**
     * 获取标签
     *
     * @return
     */
    public List<Tag> getTag() {
        return tagMapper.selectTag();
    }

    /**
     * 添加标签
     *
     * @param tag
     * @return
     */
    public int addTag(String tag) {
        return tagMapper.insertTag(tag);
    }

    /**
     * 删除标签
     *
     * @param tag
     * @return
     */
    public int delTag(String tag) {
        return tagMapper.deleteTag(tag);
    }

}
