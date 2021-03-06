package com.zyd.blog.file.alioss.entity;

import lombok.Data;

import java.util.List;

/**
 * @author dancoder
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2017/7/12 10:29
 * @since 1.8
 */
@Data
public class RefererEntity extends AbstractEntity {

    List<String> refererList;

    public RefererEntity(String bucketName) {
        super(bucketName);
    }

    public void setRefererList(List<String> refererList) {
        this.refererList = refererList;
    }
}
