package com.zyd.blog.business.dto;

import lombok.Data;

/**
 * 系统通知详情，用于页面传输
 *
 * @author dancoder
 * @website https://www.dancoder.cn
 * @version 1.0
 * @date 2018/4/16 16:26
 * @since 1.0
 */
@Data
public class SysNoticeDTO {
    private String title;
    private String content;
}
