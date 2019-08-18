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
                <i class="fa fa-weibo"></i>
                <a href="javascript:void(0)" onclick="openWin('https://www.baidu.com','weibo','500','500')" class="fs12 opwb pos-r">微博登录</a>

                <img style="vertical-align: sub;margin: auto 3px;" src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190818222336862.png">
                <a href="javascript:void(0)" onclick="openWin('https://www.oschina.net/action/oauth2/authorize?response_type=code&client_id=fZ4Il86LrdPL5BQuKvsf&redirect_uri=http://fei.free.idcfengye.com/oauth/callback/oschina&state=5f5bd1c8f093446e5aef2be59c8d302d','oschina','500','500')" class="fs12 opwb pos-r">开源中国登录</a>

                <img style="vertical-align: sub;margin: auto 3px;" src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190818222117619.png">
                <a href="${config.staticWebSite}/oauth/render/gitee" class="fs12 opwb pos-r">码云登录</a>
            </div>
            <div>

            </div>
            <div>

            </div>
        </div>
    </div>

    <script>
        function openWin(url,name,iWidth,iHeight) {
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
            window.open(url, name, 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no');
        }

    </script>
    <div class="sidebar-module article-module hide" style="top: 0;">
        <h5 class="custom-title"><i class="fa fa-book fa-fw icon"></i><strong>本文目录</strong><i class="fa fa-close pull-right close-article-menu hide pointer"></i><small></small></h5>
        <div id="article-menu">
            <ul class="list-unstyled"></ul>
        </div>
    </div>
    <div class="sidebar-module">
        <h5 class="custom-title"><i class="fa fa-tags fa-fw icon"></i><strong>标签云</strong><small></small></h5>
        <@zhydTag method="tagsList" pageSize="10">
            <#if tagsList?? && (tagsList?size > 0)>
                <#list tagsList as item>
                    <a style="font-size: <@zhydTag method="random" max="15" min="10">${random}</@zhydTag>px;margin: 5px;" href="${config.siteUrl}/tag/${item.id?c}" title="${item.name!}" data-toggle="tooltip" data-placement="bottom">
                        ${item.name!}
                    </a>
                </#list>
            </#if>
        </@zhydTag>
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
                                <time style="font-size: 12px;" class="comment-meta-item timeago fs12 gray" data-timeago="2019-8-18 10:32:25" itemprop="datePublished" data-tid="40">12小时前</time>
                            </span>
                        </div>
                        <div style="background-color: #f5f5f5;line-height: 1.7;border-radius: 3px;color: #333;" class="newest_comment_content pd10 mar10-t pos-r mar5-b pjt fs13">
                            <a href="${item.sourceUrl}#comment-${item.id?c}" title="${item.briefContent!}">
                                ${item.briefContent!}
                            </a>
                        </div>
                        <span class="gray fs12" style="word-break: break-all;">来自：
                            <a href="https://www.lizenghai.com/archives/28162.html#comment-3632">${item.article.title!}</a>
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