package com.zyd.blog.business.service.impl;

import com.zyd.blog.business.annotation.RedisCache;
import com.zyd.blog.business.entity.News;
import com.zyd.blog.business.service.BizNewsService;
import com.zyd.blog.persistence.beans.BizNews;
import com.zyd.blog.persistence.mapper.BizNewsMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;


@Slf4j
@Service
public class BizNewsServiceImpl implements BizNewsService {

    @Autowired
    private BizNewsMapper bizNewsMapper;

    @Override
    @RedisCache
    public List<News> listNews(int pageSize) {
        List<BizNews> entityList = bizNewsMapper.selectAll();
        return getNews(entityList);
    }

    private List<News> getNews(List<BizNews> entityList) {
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<News> list = new ArrayList<>();
        for (BizNews entity : entityList) {
            list.add(new News(entity));
        }
        return list;
    }
}
