package com.zyd.blog.persistence.beans;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;

/**
 * 统计
 *
 * @author dancoder
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2018/4/16 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BizStatistics {
    @Transient
    private String name;
    @Transient
    private Integer value;
}
