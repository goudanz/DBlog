<#-- 搜索弹窗 -->
<div class="modal fade nav-search-box" tabindex="-1" role="dialog" aria-labelledby="navSearchModalLabel"
     xmlns="http://www.w3.org/1999/html">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" style="padding: 5px 15px;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 10px;">
                    <span aria-hidden="true">&times;</span></button>
                <h4><i class="fa fa-search"></i> 搜索文章</h4>
            </div>
            <div class="modal-body">
                <form action="/" method="post" class="form-horizontal searchForm" id="searchForm">
                    <input type="hidden" name="pageNumber" value="1">
                    <div class="input-group bottom-line">
                        <input type="text" class="form-control br-none" name="keywords" value="${model.keywords}"
                               required="required" placeholder="输入搜索内容">
                        <span class="input-group-btn">
                        <button class="btn btn-default br-none nav-search-btn pointer" type="submit"><i
                                    class="fa fa-search"></i> 搜索</button>
                    </span>
                    </div>
                    <div class="clear"></div>
                    <ul class="list-unstyled list-inline search-hot">
                        <li><strong style="position: relative;top: 2px;color: #999999;">热门搜索：</strong></li>
                        <li><a class="pointer" rel="external nofollow"><span class="label label-default">Java</span></a>
                        </li>
                        <li><a class="pointer" rel="external nofollow"><span
                                        class="label label-primary">Springboot</span></a></li>
                        <li><a class="pointer" rel="external nofollow"><span
                                        class="label label-success">Linux</span></a></li>
                        <li><a class="pointer" rel="external nofollow"><span class="label label-info">Maven</span></a>
                        </li>
                        <li><a class="pointer" rel="external nofollow"><span
                                        class="label label-warning">Bootstrap</span></a></li>
                        <li><a class="pointer" rel="external nofollow"><span class="label label-danger">阿里云</span></a>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
</div>
<!--评论弹框-->
<div class="modal fade bs-example-modal-sm" id="comment-detail-modal" tabindex="-1" role="dialog"
     aria-labelledby="comment-detail-modal-label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="comment-detail-modal-label">评论信息框</h4>
                <small><i class="fa fa-lightbulb-o fa-fw"></i>可以通过QQ号实时获取昵称和头像</small>
            </div>
            <div class="modal-body">
                <form id="detail-form">
                    <input type="hidden" name="avatar">
                    <div class="form-group input-logo">
                        <input type="text" class="form-control" name="qq" placeholder="选填" value="">
                        <img class="pull-left hide" alt="">
                        <span class="fa fa-qq pull-left" aria-hidden="true">QQ</span>
                    </div>
                    <div class="form-group input-logo">
                        <input type="text" class="form-control" name="nickname" placeholder="必填" value="匿名">
                        <span class="fa fa-user pull-left" aria-hidden="true">昵称</span>
                    </div>
                    <div class="form-group input-logo">
                        <input type="text" class="form-control" name="email" placeholder="选填">
                        <span class="fa fa-envelope pull-left" aria-hidden="true">邮箱</span>
                    </div>
                    <div class="form-group input-logo">
                        <input type="text" class="form-control" name="url" placeholder="选填">
                        <span class="fa fa-globe pull-left" aria-hidden="true">网址</span>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-default btn-sm" id="detail-form-btn"><i
                                    class="fa fa-smile-o"></i>提交评论
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="reward" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">山无棱江水为竭，冬雷震震夏雨雪，才敢请君舍</h4>
            </div>
            <div class="modal-body">
                <div class="rewardType" align="center">
                    <ul class="list-unstyle list-inline">
                        <li style="margin-right: 20px;">
                            <input type="radio" name="type" id="alipay" onclick="PaymentUtils.change(0)" data-index="0"
                                   checked="checked"><span style="margin-left: 5px;">支付宝</span>
                        </li>
                        <li style="margin-right: 20px;">
                            <input type="radio" name="type" id="wechat" onclick="PaymentUtils.change(1)" data-index="1"><span
                                    style="margin-left: 5px;">微信</span>
                        </li>
                    </ul>
                </div>
                <div id="qrcode-container" align="center" style="margin-top: 10px;"></div>
                <div style="width: 100%;color: #a3a3a3;font-size: 16px;font-family: 'Microsoft YaHei';text-align: center;">
                    转账时请备注“<strong>博客赞助</strong>”
                </div>
            </div>
        </div>
        <small class="font-bold"></small>
    </div>
    <small class="font-bold"> </small>
</div>
<script>
    /*div 块拖动*/
    /*    dragFunc("skPlayer");
        function dragFunc(id) {
            var Drag = document.getElementById(id);
            Drag.onmousedown = function(event) {
                var ev = event || window.event;
                event.stopPropagation();
                var disX = ev.clientX - Drag.offsetLeft;
                var disY = ev.clientY - Drag.offsetTop;
                document.onmousemove = function(event) {
                    var ev = event || window.event;
                    debugger
                    Drag.style.left = ev.clientX - disX + "px";
                    Drag.style.top = ev.clientY - disY + "px";
                    Drag.style.cursor = "move";
                };
            };
            Drag.onmouseup = function() {
                document.onmousemove = null;
                this.style.cursor = "default";
            };
        };*/
</script>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog">
    <div class="login-dialog">
        <div class="dialog__content">
            <button class="pos-a form-close text" data-dismiss="modal" aria-label="Close">
                <i class="fa fa-times"></i>
            </button>
            <div class="form-title pd10">
                <h2><img src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190817235024741.png"
                         class="sign-header"></h2>
            </div>

            <div id="div_register" class="sign-form-pd pos-r">
                <form submit="return false" id="register-from" class="sign-form-input">
                    <div class="bor-out">
                        <label>
							<span class="tip-icon">
								<i class="fa fa-user-o"></i>
							</span>
                            <input disabled type="text" autocorrect="off" autocapitalize="off" autocomplete="off"
                                   spellcheck="false" name="username" tabindex="1" placeholder="昵称" class="username">
                            <span class="sign-des">支持中文，英文，用于登录</span>
                        </label> <!---->
                        <label>
							<span class="tip-icon">
								<i class="fa fa-envelope-o"></i>
							</span>
                            <input disabled type="text" name="email" autocorrect="off" autocapitalize="off" autocomplete="off"
                                   spellcheck="false" tabindex="2" placeholder="邮箱" class="phone-email">
                            <span class="sign-des">用作找回密码</span>
                        </label> <!---->
                        <label>
							<span class="tip-icon">
								<i class="fa fa-key"></i>
							</span>
                            <input disabled type="password" name="password" autocorrect="off" autocapitalize="off"
                                   autocomplete="off" spellcheck="false" tabindex="5" placeholder="密码" class="pass">
                            <span class="sign-des">6位以上</span>
                        </label> <!----> <!----> <!---->
                    </div>
                    <div class="t-c mar20-t">
                        <button disabled class="submit w100" onclick="register();"><b class=""></b>
                            <span id="register-btn">提交注册</span>
                        </button> <!---->
                    </div>
                    <div class="sign-info mar20-t clearfix fs12">
                        <div class="fl">忘记密码？
                            <span onclick="changePage('forget')">找回</span>
                        </div>
                        <div class="fr">已有帐号？
                            <span onclick="changePage('login')">登录</span>
                        </div>
                    </div>
                </form>
            </div>

            <div id="div_login" class="sign-form-pd pos-r">
                <form id="login-from" class="sign-form-input">
                    <div class="bor-out"><!----> <!---->
                        <#--<label>
							<span class="tip-icon">
								<i class="fa fa-envelope-o"></i>
							</span>
                            <input type="text" autocorrect="off" autocapitalize="off" autocomplete="off"
                                   spellcheck="false" name="username" tabindex="2" placeholder="邮箱" class="phone-email">
                            <!--&ndash;&gt;
                        </label> <!--&ndash;&gt;-->
                        <label>
							<span class="tip-icon">
								<i class="fa fa-user-o"></i>
							</span>
                            <input disabled type="text" autocorrect="off" autocapitalize="off" autocomplete="off"
                                   spellcheck="false" id="username" name="username" tabindex="1" placeholder="昵称"
                                   class="username">
                            <span class="sign-des">支持中文，英文</span>
                        </label>
                        <label>
							<span class="tip-icon">
								<i class="fa fa-key"></i>
							</span>
                            <input disabled type="password" autocorrect="off" autocapitalize="off" autocomplete="off"
                                   spellcheck="false" id="password" name="password" tabindex="5" placeholder="密码"
                                   class="pass">
                            <!---->
                        </label>
                        <#--<div id="verify">
                         </div>-->
                        <#-- <label id="checkcode" class="checkcode-div">
                             <div class="fd mouh pos-r">
                                 <span class="bg-img"
                                       style="background-image: url(&quot;https://www.lizenghai.com/wp-content/themes/seven/inc/recaptcha.php?time=1566045210689&quot;);"></span>
                             </div>
                             <input type="text" autocorrect="off" autocapitalize="off" autocomplete="off"
                                    spellcheck="false" name="checkcode" tabindex="5" placeholder="验证码"
                                    class="checkcode fd">
                        </label>-->
                    </div>
                    <div class="t-c mar20-t">
                        <button disabled type="submit" onclick="usersLogin();" class="submit w100">
                            <b class=""></b>
                            <span>立刻登录</span>
                        </button>
                        <div class="submit-error mar10-t mouh">
                            <span id="fs12" class="fs12">请暂时使用社交帐号登录，谢谢</span><i class="fa fa-smile-o"></i><i class="fa fa-smile-o"></i><i class="fa fa-smile-o"></i>
                        </div>
                    </div>
                    <div class="sign-info mar20-t clearfix fs12">
                        <div class="fl">忘记密码？
                            <span onclick="changePage('forget')">找回</span>
                        </div>
                        <div class="fr">没有帐号？
                            <span onclick="changePage('register')">注册</span>
                        </div>
                    </div>
                </form>
            </div>

            <div id="div_forget" class="sign-form-pd pos-r">
                <form class="sign-form-input">
                    <div class="bor-out"><!---->
                        <p class="fs12 mar10-b">验证码将会发送至你的注册邮箱或手机</p>
                        <label>
                                <span class="tip-icon">
                                    <i class="fa fa-envelope-o"></i>
                                </span>
                            <input disabled type="text" autocorrect="off" autocapitalize="off" autocomplete="off"
                                   spellcheck="false" name="username" tabindex="2" placeholder="邮箱"
                                   onchange="console.log(this.value);" class="phone-email">
                            <!---->
                        </label>
                        <label id="sendcode">
                                <span class="tip-icon">
                                    <i class="iconfont zrz-icon-font-ecurityCode"></i>
                                </span>
                            <input disabled type="text" name="code" tabindex="3" autocorrect="off" autocapitalize="off"
                                   autocomplete="off" spellcheck="false" placeholder="验证码" class="code">
                            <span class="send-code button">发送验证码</span>
                        </label>
                    </div>
                    <div class="t-c mar20-t">
                        <button disabled type="submit" class="submit w100">
                            <b class=""></b>
                            <span>下一步</span>
                        </button> <!---->
                    </div>
                    <div class="sign-info mar20-t clearfix fs12">
                        <div class="fl">忘记密码？
                            <span>找回</span>
                        </div>
                        <div class="fr">已有帐号？
                            <span onclick="changePage('login')">登录</span>
                        </div>
                    </div>
                </form>
            </div>

            <div class="open-sign pd20">
                <p class="fs12 gray pos-r">
                    <span>社交帐号直接登录</span>
                </p>
                <div class="form-open mar20-t">
                    <a href="${config.staticWebSite}/oauth/render/qq" title="QQ">
                        <button class="qq-ico empty">
                            <i class="fa fa-qq"></i> QQ登录
                        </button>
                    </a>
                    <a href="${config.staticWebSite}/oauth/render/gitee" title="github">
                        <button class="github-ico empty">
                            <img style="vertical-align: sub;margin: auto 3px;"
                                 src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190818222117619.png">
                            码云登录
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function usersLogin() {
        var username = $.trim($("#username").val());
        var password = $.trim($("#password").val());
        if (username == "") {
            $("#fs12").innerHTML = "请输入用户名!";
            return false;
        } else if (password == "") {
            $("#fs12").innerHTML = "请输入密码!";
            return false;
        }
        //ajax去服务器端校验
        var data = {username: username, password: password};

        $.ajax({
            type: "POST",
            url: "/guest/login",
            data: data,
            dataType: 'json',
            success: function (json) {
                console.log(json);
                alert(1);
                if (json.status == 200) {
                    // window.location.href = "{:U('Index/personal')}";
                } else {
                    alert("登录失败，请重试!");
                }
            },
            error:function (json) {
                alert(2);
            }
        });
    }

</script>

<div id="loading">
    <div class="filter"></div>
    <div class="loader">
        <div class="loading-1"></div>
        <div class="loading-2">Loading...</div>
    </div>
</div>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col col-xs-12 col-md-12 col-lg-12">
                <#if url?? && (url == "index")>
                    <div class="inline external-links" style="background-color: #f0f2f5;padding: 10px;border: 1px dashed #ccc;line-height: 1.8;">
                        <a>友情链接：</a>
                        <#if indexLinkList?? && (indexLinkList?size > 0)>
                            <#list indexLinkList as item>
                                <a href="${item.url}" target="_blank" title="${item.description!}" data-toggle="tooltip"
                                   data-placement="right">
                                    ${item.name!}
                                </a>
                            </#list>
                            <a href="${config.siteUrl}/links" title="更多链接" data-toggle="tooltip" data-placement="right"><i
                                        class="fa fa-plus"></i>更多链接</a>
                        <#else>
                            <a href="${config.siteUrl}/links" title="申请友链" data-toggle="tooltip" data-placement="right">申请友链</a>
                        </#if>
                    </div>
                </#if>
                <p>
                    <ul class="list-unstyled list-inline">
                        <li>其他连接：</li>
                        <li><a href="${config.siteUrl}/sitemap.html" target="_blank" title="网站地图" data-toggle="tooltip"
                               data-placement="bottom"><i class="fa fa-map-o fa-fw"></i>网站地图</a></li>
                        <li><a href="${config.siteUrl}/recommended" title="站长推荐" data-toggle="tooltip"
                               data-placement="bottom"><i class="fa fa-thumbs-o-up fa-fw"></i>站长推荐</a></li>
                        <li><a href="${config.siteUrl}/updateLog" title="更新记录" data-toggle="tooltip"
                               data-placement="bottom"><i class="fa fa-file-o fa-fw"></i>更新记录</a></li>
                        <li><a href="${config.siteUrl}/archives" title="归档目录" data-toggle="tooltip" data-placement="bottom"><i
                                        class="fa fa-folder-o fa-fw"></i>归档目录</a></li>
                        <li><a href="${config.siteUrl}/disclaimer" title="免责声明" data-toggle="tooltip"
                               data-placement="bottom"><i class="fa fa-file-o fa-fw"></i>免责声明</a></li>
                    </ul>
                </p>
                <p>托管于
                    <a href="https://promotion.aliyun.com/ntms/act/ambassador/sharetouser.html?userCode=wylo59db"
                         target="_blank" title="阿里云-为了无法计算的价值" data-toggle="tooltip" data-placement="bottom"
                         rel="external nofollow">阿里云
                    </a>
                    <#if config.recordNumber!> ·
                        <a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank"
                            title="查看备案信息" data-toggle="tooltip" data-placement="bottom"
                            rel="external nofollow">${config.recordNumber}
                        </a>
                    </#if>
                    <a href="https://tongji.baidu.com/web/welcome/ico?s=16388bd2558aacf1b4e832b4feb2a061" target="_blank" title="" data-toggle="tooltip" data-placement="right" rel="external nofollow" data-original-title="点击查看蛋码农博客网站统计详情"><i class="fa fa-bar-chart-o fa-fw"></i>网站统计</a>
                </p>

            </div>
            <div class="col col-md-4"></div>
        </div>
    </div>
</footer>
<div id="skPlayer" style="display: none;float: right;position: fixed;bottom: 120px;left: 50px;transition:1s;"></div>
<div id="musicContainer" style="float: right;position: fixed;bottom: 100px;bottom: 50px">
    <a id="musicSwitch" href="javascript:void(0)" onclick="clickEvent()" class="active"></a>
</div>
<#--<a id="musicSwitch" href="javascript:void(0)" class="active"></a>-->
<a class="to-top" title="点击返回顶部" data-toggle="tooltip" data-placement="bottom"></a>
<script src="https://cdn.dingxiang-inc.com/ctu-group/captcha-ui/index.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@1.11.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.0/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-lazyload@1.9.3/jquery.lazyload.min.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/jquery-confirm@3.3.2/dist/jquery-confirm.min.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/jquery.fancybox@2.1.5/source/jquery.fancybox.min.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/bootstrapvalidator@0.5.4/dist/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/xss@0.3.3/dist/xss.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/mustache@2.3.0/mustache.min.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/login/jquery.verify.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/dist/skPlayer.min.js"></script>
<script type="text/javascript">
    var appConfig = {
        siteName: '${config.siteName}',
        wwwPath: '${config.siteUrl}',
        cmsPath: '${config.cmsUrl}',
        staticPath: '${config.staticWebSite}',
        lazyloadPath: '${config.lazyloadPath}',
        fileStoragePath: '${config.fileStoragePath}',
        wxPraiseCode: '${config.wxPraiseCode}',
        zfbPraiseCode: '${config.zfbPraiseCode}',
        anonymous: '${config.anonymous}',
        editorPlaceholder: '${config.editorPlaceholder}',
        editorAlert: '${config.editorAlert}',
        dynamicTitle: '${config.dynamicTitle}'
    };

    var oauthConfig = {
        loginUserId: '${user.id}',
        loginUserName: '${user.username}',
        loginUserAvatar: '${user.avatar}'
    }

    var flag = false;
    function clickEvent(){
        var skplayer = document.getElementById("skPlayer");
        if (skplayer.style.display == 'none'){
            skplayer.style.display="block";
            if(!$('#skPlayer').find('audio').length) {
                var player = new skPlayer({
                    autoplay: true,
                    music: {
                        type: 'file',
                        source: [
                            {
                                name: '来自尘埃的光',
                                //必需项,歌名
                                author: '蔡维泽',
                                //必需项,歌手
                                src: 'https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/music/%E8%94%A1%E7%BB%B4%E6%B3%BD%20-%20%E6%9D%A5%E8%87%AA%E5%B0%98%E5%9F%83%E7%9A%84%E5%85%89%20.mp3',
                                //必需项,音乐文件
                                cover: 'https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190901213812095.jpg'
                            }]//406272416
                    }
                });
            }
        }else if(skplayer.style.display == 'block'){
            skplayer.style.display="none";
        }
    }

    function IsPC() {
        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone",
            "SymbianOS", "Windows Phone",
            "iPad", "iPod"];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }
    function ca() {
        if (!IsPC()){
            document.getElementById("skPlayer").style.display="none";
        }
    }
    ca();
    /*    var myCaptcha = _dx.Captcha(document.getElementById('checkcode'), {
            appId: '08a0d823c7a6fa885cc9ef871d8941b5', //appId，在控制台中“应用管理”或“应用配置”模块获取
            style: 'inline',
            language: 'zh_cn', // 语言为英语
            width: 300,
            success: function (token) {
                console.log('token:', token)
            }
        })*/

    function sendCode() {
    debugger
        var val = $(this).attr("value");
        if (val.length > 0) {
            sendcode_div.style.display = 'block';
        } else if (val.length == 0) {
            sendcode_div.style.display = 'none';
        }
    };

    // 切换登录/注册界面
    function changePage(val) {
        var login_div = document.getElementById("div_login");
        var register_div = document.getElementById("div_register");
        var forget_div = document.getElementById("div_forget");
        if (val == 'login') {
            login_div.style.display = 'block';    // 切换效果的关键，思路就是将要显示的 display设置为 block
            register_div.style.display = 'none';  // 然后将要隐藏的盒子的 display 设置为 none
            forget_div.style.display = 'none';
        } else if (val == 'register') {
            login_div.style.display = 'none';     // 同上
            register_div.style.display = 'block';
        } else if (val == 'forget') {
            forget_div.style.display = 'block';
            login_div.style.display = 'none';
            register_div.style.display = 'none';
        }
    }
</script>
<script type="text/javascript" src="${config.staticWebSite}/js/zhyd.core.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/zhyd.comment.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/zhyd.js"></script>