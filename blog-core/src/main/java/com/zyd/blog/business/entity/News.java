package com.zyd.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zyd.blog.persistence.beans.BizNews;

public class News {

    private BizNews bizNews;

    public News(){
        this.bizNews = new BizNews();
    }

    public News(BizNews bizNews){
        this.bizNews = bizNews;
    }

    @JsonIgnore
    public BizNews getBizNews(){
        return this.bizNews;
    }

    public Long getId() {
        return this.bizNews.getId();
    }

    public void setId(Long id) {
        this.bizNews.setId(id);
    }

    public String getSrc() {
        return this.bizNews.getSrc();
    }

    public void setSrc(String src) {
        this.bizNews.setSrc(src);
    }

    public String getTitle() {
        return this.bizNews.getTitle();
    }

    public void setTitle(String title) {
        this.bizNews.setTitle(title);
    }
}
