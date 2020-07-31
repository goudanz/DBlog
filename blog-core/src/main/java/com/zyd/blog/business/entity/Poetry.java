package com.zyd.blog.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zyd.blog.persistence.beans.BizPoetry;

public class Poetry {
    private BizPoetry bizPoetry;

    public Poetry(){
        this.bizPoetry = new BizPoetry();
    }

    public Poetry(BizPoetry bizPoetry) {
        this.bizPoetry = bizPoetry;
    }

    @JsonIgnore
    public BizPoetry getBizPoetry() {
        return this.bizPoetry;
    }

    public int getId() {
        return this.bizPoetry.getId();
    }

    public void setId(int id) {
        this.bizPoetry.setId(id);
    }

    public String getTitle() {
        return this.bizPoetry.getTitle();
    }

    public void setTitle(String title) {
        this.bizPoetry.setTitle(title);
    }

    public String getParagraphs() {
        return this.bizPoetry.getParagraphs();
    }

    public void setParagraphs(String paragraphs) {
        this.bizPoetry.setParagraphs(paragraphs);
    }

    public String getAuthor() {
        return this.bizPoetry.getAuthor();
    }

    public void setAuthor(String author) {
        this.bizPoetry.setAuthor(author);
    }

    public String getType() {
        return this.bizPoetry.getType();
    }

    public void setType(String type) {
        this.bizPoetry.setType(type);
    }

    public String getTags() {
        return this.bizPoetry.getTags();
    }

    public void setTags(String tags) {
        this.bizPoetry.setTags(tags);
    }

    public String getIdStr() {
        return this.bizPoetry.getIdStr();
    }

    public void setIdStr(String idStr) {
        this.bizPoetry.setIdStr(idStr);
    }

    public String getNotes() {
        return this.bizPoetry.getNotes();
    }

    public void setNotes(String notes) {
        this.bizPoetry.setNotes(notes);
    }

}
