<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="关于 | ${config.siteName}" description="关于${config.siteName}" canonical="/resource"></@header>
    <div class="container custome-container">
        <#--BizResourceFile-->
        <nav class="breadcrumb">
            <a class="crumbs" title="返回首页" href="${config.siteUrl}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-home"></i>首页</a>
            <i class="fa fa-angle-right"></i>诗词
        </nav>
    </div>
    <div class="poetry">
        <ul>
            <li><a class="hover" href="#">唐诗</a></li>
            <li><a href="#">宋诗</a></li>
            <li><a href="#">宋词</a></li>
            <li><a href="#">论语</a></li>
            <li><a href="#">诗经</a></li>
<#--            <li><a href="#">蒙学</a></li>-->
<#--            <li><a href="#">幽梦集</a></li>-->
<#--            <li><a href="#">花间集</a></li>-->
<#--            <li><a href="#">四书五经</a></li>-->
<#--            <li><a href="#">南唐二主词</a></li>-->
            <div id="lanPos"></div>
        </ul>
    </div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@1.11.1/dist/jquery.min.js"></script>
<script>
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

    function test(object) {
        console.log(object.textContent)
        const data = {
            type: object.textContent
        };
        $.ajax({
            type: "POST",
            url: "/api/listPoetry",
            data: data,
            success: function (json) {
                console.log(json)
                // $.comment._commentDetailModal.modal('hide');
            },
            error: function (data) {
                console.log(data);
                $.alert.ajaxError();
            }
        });
    }
</script>
    <@footer>
        <script src="https://v1.hitokoto.cn/?encode=js&c=d&select=%23hitokoto" defer></script>
    </@footer>
</@compress>