<nav id="topmenu" class="navbar navbar-default navbar-fixed-top">
<#--    <div>-->
<#--        <img src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/14814543-dca25535f675e35b.png">-->
<#--    </div>-->
    <div class="menu-box">
        <div class="pull-left">
            <ul class="list-unstyled list-inline">
                <li><span id="currentTime"></span></li>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="menu-topmenu-container pull-right">
            <ul class="list-unstyled list-inline pull-left">
                <li><a href="${config.siteUrl}/resource" class="menu_a" style="color: #fb0303;" title="文档/资料" data-toggle="tooltip" data-placement="bottom">文档/资料</a></li>
                <li><a href="${config.siteUrl}/about" class="menu_a" style="color: #fb0303;" title="关于博客" data-toggle="tooltip" data-placement="bottom">关于本站</a></li>
                <li><a href="${config.siteUrl}/links" class="menu_a" style="color: #fb0303;" title="友情链接" data-toggle="tooltip" data-placement="bottom">友情链接</a></li>
            </ul>
            <#if user??>
                <ul class="list-unstyled list-inline nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle menu_a" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-user fa-fw"></i>${user.username!} <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="/oauth/logout"><i class="fa fa-sign-out"></i>退出</a></li>
                        </ul>
                    </li>
                </ul>
            <#else>
                <ul class="list-unstyled list-inline pull-left"> <li><a onclick="toLogin()" rel="nofollow" title="登录"><i class="fa fa-sign-in"></i>登录</a></li> </ul>
            </#if>
        </div>
    </div>
</nav>
<script>
    function toLogin(){
        $('#login-modal').modal('show');
    }
</script>

<nav id="mainmenu" class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="menu-box">
        <div class="navbar-header">
            <span class="pull-right nav-search toggle-search" data-toggle="modal" data-target=".nav-search-box"><i class="fa fa-search"></i></span>
            <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand logo" href="#"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <div class="pull-left site-desc" style="padding-top: 14px;">
                <#--<h1 class="auto-shake"><a href="${config.siteUrl}" data-original-title="${config.siteDesc}" data-toggle="tooltip" data-placement="bottom">${config.siteName}</a></h1>
                <p class="site-description">${config.siteDesc}</p>-->
                <a href="${config.siteUrl}">
                    <img src="http://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/logo.jpg" data-original-title="${config.siteDesc}" data-toggle="tooltip" data-placement="right" style="width: 150px;">
                </a>
            </div>
            <ul class="nav navbar-nav ">
                <li>
                    <a href="/" class="menu_a"><i class="fa fa-home"></i>首页</a>
                </li>

                <li>
                    <a href="/poetry" class="menu_a"><i class="fa fa-book"></i>诗词</a>
                </li>

                <li>
                    <a href="/booknote" class="menu_a"><i class="fa fa-file-picture-o"></i>写真集</a>
                </li>
                <@zhydTag method="types">
                    <#if types?? && types?size gt 0>
                        <#list types as item>
                            <#if item.nodes?? && item.nodes?size gt 0>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle menu_a" data-toggle="dropdown" aria-expanded="false">
                                        <i class="${item.icon!}"></i>${item.name!} <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" role="menu">
                                        <#list item.nodes as node>
                                        <li><a href="/type/${node.id?c}" title="点击查看《${node.name!}》的文章">${node.name!}</a></li>
                                        </#list>
                                    </ul>
                                </li>
                            <#else>
                                <li><a href="/type/${item.id?c}" class="menu_a"><i class="${item.icon!}"></i>${item.name!}</a></li>
                            </#if>
                        </#list>
                    </#if>
                </@zhydTag>
                <li><a href="/guestbook" class="menu_a"><i class="fa fa-comments-o"></i>留言板</a></li>
                <li><span class="pull-right nav-search main-search" data-toggle="modal" data-target=".nav-search-box"><i class="fa fa-search"></i></span></li>
            </ul>
        </div>
    </div>
</nav>