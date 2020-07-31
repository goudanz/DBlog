package com.zyd.blog.business.service;

import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.entity.Poetry;
import com.zyd.blog.business.vo.PoetryConditionVO;

public interface BizPoetryService {

    PageInfo<Poetry> listPoetryByType(PoetryConditionVO vo);

    Poetry getByTitle(String title);
}
