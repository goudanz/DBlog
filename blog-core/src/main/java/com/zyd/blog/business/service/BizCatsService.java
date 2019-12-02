package com.zyd.blog.business.service;


import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.entity.Cats;
import com.zyd.blog.business.vo.CatsConditionVO;
import com.zyd.blog.framework.object.AbstractService;

/**
 * 标签
 *
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2018/4/16 16:26
 * @since 1.0
 */
public interface BizCatsService extends AbstractService<Cats, Long> {

    PageInfo<Cats> findPageBreakByCondition(CatsConditionVO vo);

    Cats getByName(String name);
}
