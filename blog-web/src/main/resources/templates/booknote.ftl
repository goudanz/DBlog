<#include "include/macros.ftl">
<@compress single_line=false>
<@header title="写真集 | ${config.siteName}"
    description="写真集"
    canonical="/recommended">
</@header>

<div class="container custome-container">
    <nav class="breadcrumb">
        <a class="crumbs" title="返回首页" href="${config.siteUrl}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-home"></i>首页</a>
        <i class="fa fa-angle-right"></i>写真集
    </nav>
</div>
<div class="row">
    <div class="jq22-container">
        <div class="jq22-content bgcolor-3">
            <div id="catdiv">
                <#list list as item>
                    <div class="catbox"><img src="${item.content}" alt="${item.name}" class="showImage"></div>
                </#list>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@1.11.1/dist/jquery.min.js"></script>
    <script type="text/javascript" src="${config.staticWebSite}/js/dist/jquery.waterfall.js"></script>
    <script>
        $("#catdiv").waterfall({
            itemClass: ".catbox",
            minColCount: 2,
            spacingHeight: 10, // the brick element vertical spacing
            resizeable: true,
            /*ajaxCallback: function(success, end) {
                var data = {"data": [
                        { "src": "03.jpg" }, { "src": "04.jpg" }, { "src": "02.jpg" }, { "src": "05.jpg" }, { "src": "01.jpg" }, { "src": "06.jpg" }
                    ]};
                var str = "";
                var templ = '<div class="catbox" style="opacity:0;filter:alpha(opacity=0);"><div class="pic"><img src="img/{{src}}" /></div></div>'

                for(var i = 0; i < data.data.length; i++) {
                    str += templ.replace("{{src}}", data.data[i].src);
                }
                $(str).appendTo($("#div1"));
                success();
                end();
            }*/
        });
    </script>
<@footer></@footer>
</@compress>
