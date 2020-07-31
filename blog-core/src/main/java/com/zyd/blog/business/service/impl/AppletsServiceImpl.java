package com.zyd.blog.business.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.dto.BizCommentDTO;
import com.zyd.blog.business.entity.Article;
import com.zyd.blog.business.entity.Comment;
import com.zyd.blog.business.entity.Link;
import com.zyd.blog.business.enums.ArticleStatusEnum;
import com.zyd.blog.business.service.AppletsService;
import com.zyd.blog.business.service.BizArticleService;
import com.zyd.blog.business.vo.ArticleConditionVO;
import com.zyd.blog.business.vo.CommentConditionVO;
import com.zyd.blog.business.vo.LinkConditionVO;
import com.zyd.blog.persistence.beans.BizArticle;
import com.zyd.blog.persistence.beans.BizComment;
import com.zyd.blog.persistence.beans.SysLink;
import com.zyd.blog.persistence.mapper.BizArticleMapper;
import com.zyd.blog.persistence.mapper.BizCommentMapper;
import com.zyd.blog.persistence.mapper.SysLinkMapper;
import com.zyd.blog.util.BeanConvertUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Service
public class AppletsServiceImpl implements AppletsService {

    @Autowired
    private BizArticleMapper bizArticleMapper;

    @Autowired
    private BizArticleService bizArticleService;

    @Autowired
    private SysLinkMapper sysLinkMapper;

    @Autowired
    private BizCommentMapper bizCommentMapper;

    @Override
    public PageInfo<Article> listRecommended(int pageSize) {
        ArticleConditionVO vo = new ArticleConditionVO();
        return getArticleCommon(true,pageSize, vo);
    }

    /**
     *
     * @param recommended 是否为站长推荐
     * @param pageSize
     * @return
     */
    private PageInfo<Article> getArticleCommon(boolean recommended, int pageSize, ArticleConditionVO vo ){
        // recommended == false 不设值
        if (recommended) {
            vo.setRecommended(true);
        }
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        vo.setPageSize(pageSize);
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        // 查出已发布的文章
        List<BizArticle> list = bizArticleMapper.findPageBreakByCondition(vo);

        List<Article> bizArticles = new ArrayList<>();
        for (BizArticle bizArticle : list) {
            bizArticles.add(new Article(bizArticle));
        }

        PageInfo bean = new PageInfo<BizArticle>(list);
        bean.setList(bizArticles);
        return bean;
    }

    @Override
    public PageInfo<Article> listArticle(int pageSize) {
        ArticleConditionVO vo = new ArticleConditionVO();
        return getArticleCommon(false,pageSize,vo);
    }

    @Override
    public Article getByPrimaryKey(Long articleId) {
        Article article = bizArticleService.getByPrimaryKey(articleId);
        return article;
    }

    @Override
    public PageInfo<Link> getLinks() {
        LinkConditionVO vo = new LinkConditionVO();

        List<SysLink> list = sysLinkMapper.findPageBreakByCondition(vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<Link> boList = new ArrayList<>();
        for (SysLink sysLink : list) {
            boList.add(new Link(sysLink));
        }
        PageInfo bean = new PageInfo<SysLink>(list);
        bean.setList(boList);
        return bean;
    }

    @Override
    public PageInfo<Article> articleSearch(ArticleConditionVO vo) {
        return getArticleCommon(false,10, vo);
    }

    @Override
    public List<BizCommentDTO> commentsist(CommentConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<BizComment> list = bizCommentMapper.findPageBreakByCondition(vo);

        List<Comment> boList = new ArrayList<>();
        for (BizComment bizComment : list) {
            boList.add(new Comment(bizComment));
        }
        if (boList == null) {
            return null;
        }
        PageInfo bean = new PageInfo<BizComment>(list);
        bean.setList(boList);
        return convert2DTO(bean.getList());
    }

    private List<BizCommentDTO> convert2DTO(List<Comment> list) {
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<BizCommentDTO> dtoList = new LinkedList<>();
        for (Comment comment : list) {
            BizCommentDTO dto = BeanConvertUtil.doConvert(comment, BizCommentDTO.class);
            dto.setParentDTO(BeanConvertUtil.doConvert(comment.getParent(), BizCommentDTO.class));
            if (null != comment.getUser()) {
                dto.setUserType(comment.getUser().getUserTypeEnum());
            }
            dtoList.add(dto);
        }
        return dtoList;
    }
}
