package com.zyd.blog.persistence.mapper;

import com.zyd.blog.business.vo.PoetryConditionVO;
import com.zyd.blog.persistence.beans.BizPoetry;
import com.zyd.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BizPoetryMapper extends BaseMapper<BizPoetry> {

    List<BizPoetry> findPageBreakByCondition(PoetryConditionVO vo);
}
