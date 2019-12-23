<div class="col-sm-3 blog-sidebar">
    <#if articleDetail??>
        <div class="sidebar-module">
            <h5 class="custom-title"><i class="fa fa-hand-peace-o fa-fw icon"></i><strong>说给你听</strong><small></small></h5>
            <div class="div-quote">
                <i class="fa fa-quote-left fa-fw"></i><p id="hitokoto" style="margin-left: 15px;"></p>
            </div>
        </div>
    <#else>
        <div class="sidebar-module" style="position: relative;">
            <h5 class="custom-title"><i class="fa fa-home fa-fw icon"></i><strong>关于我</strong><small></small></h5>
            <div class="about-author">
                <div class="about-main">
                    <div class="about-img col-md-4">
                        <a href="${config.wxCode}" class="showImage" title="">
                            <img src="${config.wxCode}" alt="微信公众号" style="border-radius: 0;">
                        </a>
                    </div>
                    <div class="about-site col-md-8">
                        <div class="about-name">${config.siteName}</div>
                        <small class="about-the">${config.siteDesc!}</small>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </#if>
    <div class="sidebar-module">
        <h5 class="custom-title"><i class="fa fa-handshake-o fa-fw icon"></i><strong>免注册登录</strong><small></small></h5>
        <div class="div-quote">
            <div>
                <img style="vertical-align: sub;margin: auto 3px;" src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190818222336862.png">
                <a href="${config.staticWebSite}/oauth/render/oschina"  class="fs12 opwb pos-r">oschina登录</a>
                <a href="${config.staticWebSite}/oauth/render/github" class="fs12 opwb pos-r"><i class="fa fa-github fa-lg"></i> github登录</a>
                <img style="vertical-align: sub;margin: auto 3px;" src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190922183830315.png">
                <a href="${config.staticWebSite}/oauth/render/baidu" class="fs12 opwb pos-r">百度登录</a>
            </div>
        </div>
    </div>

    <div class="sidebar-module article-module hide" style="top: 0;">
        <h5 class="custom-title"><i class="fa fa-book fa-fw icon"></i><strong>本文目录</strong><i class="fa fa-close pull-right close-article-menu hide pointer"></i><small></small></h5>
        <div id="article-menu">
            <ul class="list-unstyled"></ul>
        </div>
    </div>
    <div class="sidebar-module">
        <h5 class="custom-title"><i class="fa fa-tags fa-fw icon"></i><strong>标签云</strong><small></small></h5>
        <ul class="list-unstyled list-inline">
            <@zhydTag method="tagsList" pageSize="10">
                <#if tagsList?? && (tagsList?size > 0)>
                    <#list tagsList as item>

                            <li class="tag-li">
                                <a class="btn btn-default btn-xs" href="${config.siteUrl}/tag/${item.id?c}" title="${item.name!}" data-toggle="tooltip" data-placement="bottom">
                                    ${item.name!}
                                </a>
                            </li>
                    </#list>
                </#if>
            </@zhydTag>
        </ul>
    </div>
    <@zhydTag method="recentComments" pageSize="10">
        <#if recentComments?? && recentComments?size gt 0>
            <div class="sidebar-module">
                <h5 class="custom-title"><i class="fa fa-comments fa-fw icon"></i><strong>近期评论</strong><small></small></h5>
                <ul class="list-unstyled list-inline comments">
                <#list recentComments as item>
                    <li>
                        <div class="clearfix" style="display: block;">
                            <span>
                                <img alt="${item.nickname!}" src="${item.avatar!}" class="avatar" width="50" height="50" onerror="this.src='${config.staticWebSite}/img/user.png'">
                            </span>
                            <span class="newest_comment_author">
                                <a id="user-271" class="users" href="">${item.nickname!}</a>
                            </span>
                            <span class="fr" style="float: right;">
                                <time style="font-size: 12px;" class="comment-meta-item timeago fs12 gray" itemprop="datePublished" data-tid="40">${item.createTime?string('yyyy-MM-dd HH:mm')}</time>
                            </span>
                        </div>
                        <div style="background-color: #f0f2f5;line-height: 1.7;border-radius: 3px;color: #333;" class="newest_comment_content pd10 mar10-t pos-r mar5-b pjt fs13">
                            <a href="${item.sourceUrl}#comment-${item.id?c}" title="${item.briefContent!}">
                                ${item.briefContent!}
                            </a>
                        </div>
                        <span class="gray fs12" style="word-break: break-all;">来自：
                            <a href="${config.siteUrl}/article/${item.articleId}">${item.articleTitle!}</a>
                        </span>
                        <#--<a href="${item.sourceUrl}#comment-${item.id?c}" title="${item.briefContent!}" rel="external nofollow" data-toggle="tooltip" data-placement="bottom">
                            <img alt="${item.nickname!}" src="${item.avatar!}" class="avatar auto-shake" height="64" width="64" onerror="this.src='${config.staticWebSite}/img/user.png'" />
                            <span class="comment-author">${item.nickname!}</span> ${item.briefContent!}
                        </a>-->
                    </li>
                </#list>
                </ul>
            </div>
        </#if>
    </@zhydTag>
    <div class="sidebar-module">
        <ul class="nav nav-tabs sidebar-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-list"></i>近期文章</a></li>
            <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-thumbs-o-up"></i>站长推荐</a></li>
            <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><i class="fa fa-hand-peace-o"></i>随机文章</a></li>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="profile">
                <ol class="list-unstyled">
                    <@articleTag method="recentArticles" pageSize="10">
                        <#if recentArticles?? && (recentArticles?size > 0)>
                            <#list recentArticles as item>
                                <li>
                                    <a href="${config.siteUrl}/article/${item.id?c}" title="${item.title}" data-toggle="tooltip" data-placement="bottom">
                                        <span class="li-icon li-icon-${item?index+1}">${item?index+1}</span> ${item.title}
                                    </a>
                                </li>
                            </#list>
                        <#else>
                            <li class="empty-list">
                                <i class="fa fa-bookmark-o fa-fw"></i> 暂无相关文章
                            </li>
                        </#if>
                    </@articleTag>
                </ol>
            </div>
            <div role="tabpanel" class="tab-pane" id="home">
                <ol class="list-unstyled">
                    <@articleTag method="recommendedList" pageSize="10">
                        <#if recommendedList?? && (recommendedList?size > 0)>
                            <#list recommendedList as item>
                                <li>
                                    <a href="${config.siteUrl}/article/${item.id?c}" title="${item.title}" data-toggle="tooltip" data-placement="bottom">
                                        <span class="li-icon li-icon-${item?index+1}">${item?index+1}</span> ${item.title}
                                    </a>
                                </li>
                            </#list>
                        <#else>
                            <li class="empty-list">
                                <i class="fa fa-bookmark-o fa-fw"></i> 暂无相关文章
                            </li>
                        </#if>
                    </@articleTag>
                </ol>
            </div>
            <div role="tabpanel" class="tab-pane" id="messages">
                <ol class="list-unstyled">
                    <@articleTag method="randomList" pageSize="10">
                        <#if randomList?? && (randomList?size > 0)>
                            <#list randomList as item>
                                <li>
                                    <a href="${config.siteUrl}/article/${item.id?c}" title="${item.title}" data-toggle="tooltip" data-placement="bottom">
                                        <span class="li-icon li-icon-${item?index+1}">${item?index+1}</span> ${item.title}
                                    </a>
                                </li>
                            </#list>
                        <#else>
                            <li class="empty-list">
                                <i class="fa fa-bookmark-o fa-fw"></i> 暂无相关文章
                            </li>
                        </#if>
                    </@articleTag>
                </ol>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="sidebar-module">
        <h5 class="custom-title"><i class="fa fa-info fa-fw icon"></i><strong>网站信息</strong><small></small></h5>
        <ul class="ul-default site-info">
            <@zhydTag method="siteInfo">
                <li> <i class="fa fa-file fa-fw"></i>  文章总数：${siteInfo.articleCount!(0)} 篇</li>
                <li> <i class="fa fa-tags fa-fw"></i> 标签总数：${siteInfo.tagCount!(0)} 个</li>
                <li> <i class="fa fa-folder-open fa-fw"></i> 分类总数：${siteInfo.typeCount!(0)} 个</li>
                <li> <i class="fa fa-comments fa-fw"></i> 留言数量：${siteInfo.commentCount!(0)} 条</li>
                <li> <i class="fa fa-users fa-fw"></i> 在线人数：<span class="online">1</span>人</li>
                <li> <i class="fa fa-calendar fa-fw"></i> 运行天数：${siteInfo.installdate!(1)}天</li>
                <li> <i class="fa fa-pencil-square fa-fw"></i> 最后更新：${siteInfo.lastUpdateTime!("暂无更新记录")}</li>
            </@zhydTag>
        </ul>
    </div>
</div>