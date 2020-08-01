<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="诗词 | ${config.siteName}" description="诗词${config.siteName}" canonical="/resource"></@header>
    <div class="container custome-container" xmlns="http://www.w3.org/1999/html">
        <#--BizResourceFile-->
        <nav class="breadcrumb">
            <a class="crumbs" title="返回首页" href="${config.siteUrl}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-home"></i>首页</a>
            <i class="fa fa-angle-right"></i>诗词
        </nav>
    </div>
    <div class="poetry">
        <ul style="float: left;">
            <li><a class="hover" href="#">唐诗</a></li>
            <li><a href="#">宋诗</a></li>
            <li><a href="#">宋词</a></li>
            <li><a href="#">论语</a></li>
            <li><a href="#">诗经</a></li>
            <div id="lanPos"></div>
        </ul>

        <div style="overflow:hidden;width: 64%;">
            <#list page.list as item>
                <div class="content">
                    <div>
                        <h4>${item.title}</h4>
                        <span>${item.author}</span>
                    </div>
                    <div>
                        ${item.paragraphs}
                    </div>
                </div>
            </#list>
        </div>
    </div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@1.11.1/dist/jquery.min.js"></script>
<script>
    function test(object) {
        const data = {
            type: object.textContent
        };
        $.ajax({
            type: "POST",
            url: "/api/listPoetry",
            data: data,
            success: function (json) {
                var list = json.data.list;
                var ret = "";
                for(var i = 0, len = list.length; i < len ; i ++){
                    ret += "<div class=\"content\"><div>";
                    ret += "<h4>" + list[i].title +"</h4>";
                    ret += "<span>" + list[i].author + "</span></div>";
                    ret += "<div>" + list[i].paragraphs.replaceAll(/。/,"。</br>") + "</div></div>";
                }
                $("#poetryContent").append(ret);
            },
            error: function (data) {
                console.log(data);
                $.alert.ajaxError();
            }
        });
    }

    $(function(){
        $('#lanPos').css('top',$('.hover').offset().top-158);
        $('.poetry ul li').hover(function(){
            $('#lanPos').css('top',$(this).offset().top-158);
        },function(){
            $('#lanPos').css('top',$('.hover').offset().top-158);
        })

        $('.poetry ul li').click(function(){
            for(var i=0;i<$('.poetry ul li').size();i++){
                if(this==$('.poetry ul li').get(i)){
                    $('.poetry ul li').eq(i).children('a').addClass('hover');
                    test(this);
                }else{
                    $('.poetry ul li').eq(i).children('a').removeClass('hover');
                }
            }
        })

    })
</script>
    <@footer>
        <script src="https://v1.hitokoto.cn/?encode=js&c=d&select=%23hitokoto" defer></script>
    </@footer>
</@compress>