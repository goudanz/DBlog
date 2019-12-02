package com.zyd.blog.persistence.mapper;

import com.zyd.blog.business.vo.CatsConditionVO;
import com.zyd.blog.business.vo.TagsConditionVO;
import com.zyd.blog.persistence.beans.BizCats;
import com.zyd.blog.persistence.beans.BizTags;
import com.zyd.blog.plugin.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @website https://www.dancoder.cn
 * @version 1.0
 * @date 2018/4/16 16:26
 * @since 1.0
 */
@Repository
public interface BizCatsMapper extends BaseMapper<BizCats>{

    /**
     * 分页查询
     * @param vo
     *
     * @return
     */
    List<BizCats> findPageBreakByCondition(CatsConditionVO vo);
}
