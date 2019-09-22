package com.zyd.blog.business.service.impl;

import com.zyd.blog.business.service.EssayService;
import com.zyd.blog.persistence.beans.Essay;
import com.zyd.blog.persistence.mapper.EssayMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class EssayServiceImpl implements EssayService {

    @Autowired
    private EssayMapper essayMapper;

    @Override
    public List<Essay> listEssay() {
        return essayMapper.listEssay();
    }
}
