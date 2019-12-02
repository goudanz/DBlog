package com.zyd.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zyd.blog.persistence.beans.BizCats;

public class Cats {
    private BizCats bizCats;

    public Cats() {
        this.bizCats = new BizCats();
    }

    public Cats(BizCats bizCats) {
        this.bizCats = bizCats;
    }

    @JsonIgnore
    public BizCats getBizCats() {
        return this.bizCats;
    }

    public Long getId() {
        return this.bizCats.getId();
    }

    public void setId(Long id) {
        this.bizCats.setId(id);
    }

    public String getName() {
        return this.bizCats.getName();
    }

    public void setName(String name) {
        this.bizCats.setName(name);
    }

    public String getContent() {
        return this.bizCats.getContent();
    }

    public void setContent(String content) {
        this.bizCats.setContent(content);
    }
}
