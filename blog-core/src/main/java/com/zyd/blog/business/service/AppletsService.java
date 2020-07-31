package com.zyd.blog.business.service;

import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.dto.BizCommentDTO;
import com.zyd.blog.business.entity.Article;
import com.zyd.blog.business.entity.Link;
import com.zyd.blog.business.vo.ArticleConditionVO;
import com.zyd.blog.business.vo.CommentConditionVO;

import java.util.List;

public interface AppletsService {

    /**
     * 站长推荐 小程序
     * @param pageSize
     * @return
     */
    PageInfo<Article> listRecommended(int pageSize);

    /**
     * 首页列表
     * @param pageSize
     * @return
     */
    PageInfo<Article> listArticle(int pageSize);

    /**
     * 文章详情页
     * @param articleId
     * @return
     */
    Article getByPrimaryKey(Long articleId);

    /**
     * 友情链接
     * @return
     */
    PageInfo<Link> getLinks();

    /**
     * 文章搜索
     * @param vo
     * @return
     */
    PageInfo<Article> articleSearch(ArticleConditionVO vo);

    /**
     * 评论列表
     * @param vo
     * @return
     */
    List<BizCommentDTO> commentsist(CommentConditionVO vo);
}
