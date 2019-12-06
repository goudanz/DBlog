package com.zyd.blog.business.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.annotation.RedisCache;
import com.zyd.blog.business.entity.Cats;
import com.zyd.blog.business.service.BizCatsService;
import com.zyd.blog.business.vo.CatsConditionVO;
import com.zyd.blog.framework.exception.ZhydException;
import com.zyd.blog.persistence.beans.BizCats;
import com.zyd.blog.persistence.mapper.BizCatsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 标签
 *
 * @author dancoder
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class BizCatsServiceImpl implements BizCatsService {

    @Autowired
    private BizCatsMapper bizCatsMapper;

    @Override
    public PageInfo<Cats> findPageBreakByCondition(CatsConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<BizCats> list = bizCatsMapper.findPageBreakByCondition(vo);
        List<Cats> boList = getCats(list);
        if (boList == null) return null;
        PageInfo bean = new PageInfo<BizCats>(list);
        bean.setList(boList);
        return bean;
    }

    @Override
    public Cats getByName(String name) {
        if (StringUtils.isEmpty(name)) {
            return null;
        }
        BizCats cats = new BizCats();
        cats.setName(name);
        cats = bizCatsMapper.selectOne(cats);
        return null == cats ? null : new Cats(cats);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public Cats insert(Cats entity) {
        Assert.notNull(entity, "Cats不可为空！");
        if (this.getByName(entity.getName()) != null) {
            throw new ZhydException("标签添加失败，标签已存在！[" + entity.getName() + "]");
        }
        bizCatsMapper.insertSelective(entity.getBizCats());
        return entity;
    }

    @Override
    public boolean removeByPrimaryKey(Long primaryKey) {
        return false;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean updateSelective(Cats entity) {
        Assert.notNull(entity, "Cats不可为空！");
        Cats old = this.getByName(entity.getName());
        if (old != null && !old.getId().equals(entity.getId())) {
            throw new ZhydException("猫片修改失败，猫片已存在！[" + entity.getName() + "]");
        }
        return bizCatsMapper.updateByPrimaryKeySelective(entity.getBizCats()) > 0;
    }

    @Override
    public Cats getByPrimaryKey(Long primaryKey) {
        return null;
    }

    @Override
    @RedisCache
    public List<Cats> listAll() {
        List<BizCats> entityList = bizCatsMapper.selectAll();

        return getCats(entityList);
    }

    private List<Cats> getCats(List<BizCats> entityList) {
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<Cats> list = new ArrayList<>();
        for (BizCats entity : entityList) {
            list.add(new Cats(entity));
        }
        return list;
    }
}
