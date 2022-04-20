package com.blog.service;

import com.blog.mapper.CollectMapper;
import com.blog.model.Article;
import com.blog.model.Collect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Yang Yezhuang
 * @date: 2022/4/19
 */
@Service
public class CollectService {
    @Autowired
    CollectMapper collectMapper;

    /**
     * 获取用户收藏的文章
     *
     * @param uid
     * @return
     */
    public List<Article> listUserCollect(long uid) {
        return collectMapper.queryCollectByUid(uid);
    }

    /**
     * 添加收藏
     *
     * @param uid
     * @param article_id
     * @return
     */
    public int insertCollect(long uid, long article_id) {
        return collectMapper.insertCollect(uid, article_id);
    }

    /**
     * 取消收藏
     *
     * @param uid
     * @param article_id
     * @return
     */
    public int deleteCollect(long uid, long article_id) {
        return collectMapper.deleteCollect(uid, article_id);
    }
}
