package com.zyd.blog.business.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.entity.Poetry;
import com.zyd.blog.business.service.BizPoetryService;
import com.zyd.blog.business.vo.PoetryConditionVO;
import com.zyd.blog.persistence.beans.BizPoetry;
import com.zyd.blog.persistence.mapper.BizPoetryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class BizPoetryServiceImpl implements BizPoetryService {

    @Autowired
    private BizPoetryMapper bizPoetryMapper;

    @Override
    public PageInfo<Poetry> listPoetryByType(PoetryConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        if (StringUtils.isEmpty(vo.getType())) {
            vo.setType("唐诗");
        }
        List<BizPoetry> list = bizPoetryMapper.findPageBreakByCondition(vo);
        List<Poetry> boList = getPoetries(list);
        if (boList == null) return null;
        PageInfo bean = new PageInfo<BizPoetry>(list);
        bean.setList(boList);
        return bean;
    }

    private List<Poetry> getPoetries(List<BizPoetry> entityList) {
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<Poetry> list = new ArrayList<>();
        for (BizPoetry entity : entityList) {
            list.add(new Poetry(entity));
        }
        return list;
    }

    @Override
    public Poetry getByTitle(String title) {
        if (StringUtils.isEmpty(title)) {
            return null;
        }
        BizPoetry poetry = new BizPoetry();
        poetry.setTitle(title);
        poetry = bizPoetryMapper.selectOne(poetry);
        return null == poetry ? null : new Poetry(poetry);
    }
}
