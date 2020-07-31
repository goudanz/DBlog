package com.zyd.blog.persistence.beans;

import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
public class BizPoetry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String title;
    private String paragraphs;
    private String author;
    private String type;
    private String tags;
    private String idStr;
    private String notes;
}
