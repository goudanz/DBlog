package com.zyd.blog.controller;

import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.annotation.BussinessLog;
import com.zyd.blog.business.entity.Article;
import com.zyd.blog.business.entity.Link;
import com.zyd.blog.business.enums.CommentStatusEnum;
import com.zyd.blog.business.enums.PlatformEnum;
import com.zyd.blog.business.service.AppletsService;
import com.zyd.blog.business.vo.ArticleConditionVO;
import com.zyd.blog.business.vo.CommentConditionVO;
import com.zyd.blog.framework.object.ResponseVO;
import com.zyd.blog.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/applets")
public class AppletsController {

    @Autowired
    private AppletsService appletsService;

    /**
     * 站长推荐
     * @return
     */
    @GetMapping("/recommended")
    @BussinessLog(value = "站长推荐", platform = PlatformEnum.WEB, save = false)
    public ResponseVO recommended() {
        PageInfo<Article> pageInfo = appletsService.listRecommended(10);
        return ResultUtil.success(null, pageInfo);
    }

    /**
     * 首页列表
     * @return
     */
    @GetMapping("/articleList")
    @BussinessLog(value = "首页列表", platform = PlatformEnum.WEB, save = false)
    public ResponseVO articleList(int pageSize) {
        PageInfo<Article> pageInfo = appletsService.listArticle(pageSize);
        return ResultUtil.success(null, pageInfo);
    }

    /**
     * 搜索文章
     * @return
     */
    @GetMapping("/article/search")
    @BussinessLog(value = "首页列表", platform = PlatformEnum.WEB, save = false)
    public ResponseVO articleSearch(ArticleConditionVO vo) {
        PageInfo<Article> pageInfo = appletsService.articleSearch(vo);
        return ResultUtil.success(null, pageInfo);
    }

    /**
     * 文章详情
     * @param articleId
     * @return
     */
    @GetMapping("/article/{articleId}")
    @BussinessLog(value = "进入文章[{2}]详情页", platform = PlatformEnum.WEB)
    public ResponseVO article(@PathVariable("articleId") Long articleId) {
        Article article = appletsService.getByPrimaryKey(articleId);
        return ResultUtil.success(null, article);
    }

    /**
     * 友情链接
     * @return
     */
    @GetMapping("/links")
    @BussinessLog(value = "友情链接", platform = PlatformEnum.WEB)
    public ResponseVO links() {
        PageInfo<Link> links = appletsService.getLinks();
        return ResultUtil.success(null, links);
    }

    /**
     * 评论列表
     * @param vo
     * @return
     */
    @GetMapping("/comments")
    @BussinessLog(value = "评论列表", platform = PlatformEnum.WEB, save = false)
    public ResponseVO comments(CommentConditionVO vo) {
        vo.setStatus(CommentStatusEnum.APPROVED.toString());
        return ResultUtil.success(null, appletsService.commentsist(vo));
    }
}
