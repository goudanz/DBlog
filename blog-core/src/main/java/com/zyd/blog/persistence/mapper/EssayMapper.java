package com.zyd.blog.persistence.mapper;

import com.zyd.blog.persistence.beans.Essay;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EssayMapper {
    List<Essay> listEssay();
}
