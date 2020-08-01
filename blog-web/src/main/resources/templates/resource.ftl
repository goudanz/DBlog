<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="文档/资料 | ${config.siteName}" description="文档/资料${config.siteName}" canonical="/resource"></@header>

<div class="container custome-container">
    <#--BizResourceFile-->
        <nav class="breadcrumb">
            <a class="crumbs" title="返回首页" href="${config.siteUrl}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-home"></i>首页</a>
            <i class="fa fa-angle-right"></i>文档/资料
        </nav>
        <@articleTag method="BizResourceFile" pageSize="5">
            <#if BizResourceFile?? && (BizResourceFile?size > 0)>
                <div id="myNews" class="carousel slide">
                    <div class="carousel-inner resource-inner">
                        <#list BizResourceFile as item>
                            <div class="blog-header resource-box">
                                <p>${item.originalFileName}</p>
                                <p style="color: #999;">博主上传于：${item.uploadStartTime?string('yyyy-MM-dd HH:mm')}</p>
                                <button class="download-btn" onclick="window.open('${item.fullFilePath}')"><span class="fa fa-download"></span>下载</button>
                            </div>
                        </#list>
                    </div>
                </div>
            </#if>
        </@articleTag>
</div>

    <@footer>
        <script src="https://v1.hitokoto.cn/?encode=js&c=d&select=%23hitokoto" defer></script>
    </@footer>
</@compress>