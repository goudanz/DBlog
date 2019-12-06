package com.zyd.blog.framework.config;

import tk.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Component;

/**
 *
 * @author dancoder
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2018/4/16 16:26
 * @since 1.0
 */
@Component
@MapperScan("com.zyd.blog.persistence.mapper")
public class MybatisConfig {
}
