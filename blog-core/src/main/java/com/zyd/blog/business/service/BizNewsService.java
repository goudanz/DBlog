package com.zyd.blog.business.service;

import com.zyd.blog.business.entity.News;

import java.util.List;

public interface BizNewsService {

    /**
     * 新闻轮播图
     *
     * @param pageSize
     * @return
     */
    List<News> listNews(int pageSize);
}
