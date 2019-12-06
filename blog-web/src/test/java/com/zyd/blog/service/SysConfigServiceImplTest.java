package com.zyd.blog.service;

import com.alibaba.fastjson.JSON;
import com.zyd.blog.BaseJunitTest;
import com.zyd.blog.business.service.SysConfigService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author dancoder
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2019/1/7 14:35
 * @since 1.8
 */
public class SysConfigServiceImplTest extends BaseJunitTest {

    @Autowired
    private SysConfigService configService;

    @Test
    public void comment() throws InterruptedException {
        System.out.println(JSON.toJSONString(configService.getConfigs()));
    }
}
