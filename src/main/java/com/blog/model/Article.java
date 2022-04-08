package com.blog.model;

import lombok.Data;

/**
 * 文章内容实体类
 */
@Data
public class Article {
    private long id;
    private String title;
    private String content;
    private String tag;
    private String date;
    private int year;
    private int month;

}
