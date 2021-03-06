<#--登录弹框-->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">山无棱江水为竭，冬雷震震夏雨雪，才敢请君舍</h4>
            </div>

            <div class="lc-block" id="l-login" data-ng-class="{'toggled':lctrl.login === 1}">
                <h1 class="lean">dandan</h1><#--Azrael-->

                <div class="input-group m-b-20">
                    <span class="input-group-addon">
                        <i class="zmdi zmdi-account"></i>
                    </span>
                    <div class="fg-line">
                        <input type="text" class="form-control" placeholder="Username" regex="^\w{3,16}$"/>
                    </div>
                </div>

                <div class="input-group m-b-20">
                    <span class="input-group-addon">
                        <i class="zmdi zmdi-male"></i>
                    </span>
                    <div class="fg-line">
                        <input type="password" class="form-control" placeholder="Password" regex="^\w+"/>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="" />
                        <i class="input-helper">
                            记住我吧
                        </i>
                    </label>
                </div>

                <div class="oauth-login">
                    <#--qq login-->
                    <a href="${config.staticWebSite}/oauth/render/qq" title="QQ">
                        <img src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190816122549521.png">
                    </a>
                    <#--gitee login-->
                    <a href="${config.staticWebSite}/oauth/render/gitee" title="码云">
                        <img src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190816150307927.png">
                    </a>
                    <#--oschina login-->
                    <a href="${config.staticWebSite}/oauth/render/oschina" title="开源中国">
                        <img src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190816163920505.png">
                    </a>
                    <#--github login-->
                    <a href="${config.staticWebSite}/oauth/render/github" title="github">
                        <img src="https://dancoder.oss-cn-shanghai.aliyuncs.com/oneblog/20190816164715303.jpg">
                    </a>

                </div>

                <a href="" class="btn btn-login btn-danger btn-float">
                    <i class="zmdi zmdi-arrow-forward"></i>
                </a>

                <ul class="login-navigation">
                    <li class="bgm-red" data-ng-click="lctrl.login = 0; lctrl.register = 1">Register</li>
                    <li data-block="#l-forget-password" class="bgm-orange" data-ng-click="lctrl.login = 0; lctrl.forgot = 1">Forgot Password?</li>
                </ul>
            </div>

            <div class="lc-block" id="l-register" data-ng-class="{ 'toggled': lctrl.register === 1 }" data-ng-if="lctrl.register === 1">
                <h1 class="lean">Azrael</h1>

                <div class="input-group m-b-20">
                    <span class="input-group-addon">
                        <i class="zmdi zmdi-account"></i>
                    </span>
                    <div class="fg-line">
                        <input type="text" class="form-control" placeholder="Username" regex="^\w{3,16}$"/>
                    </div>
                </div>
                <div class="input-group m-b-20">
                    <span class="input-group-addon">
                        <i class="zmdi zmdi-email"></i>
                    </span>
                    <div class="fg-line">
                        <input type="text" class="form-control" placeholder="Email Address" regex="^\w+@\w+\.[a-zA-Z]+(\.[a-zA-Z]+)?$"/>
                    </div>
                </div>
                <div class="input-group m-b-20">
                    <span class="input-group-addon">
                        <i class="zmdi zmdi-male"></i>
                    </span>
                    <div class="fg-line">
                        <input type="password" class="form-control" placeholder="Password" regex="^\w+"/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value=""/>
                        <i class="input-helper"></i>
                        Accept the license agreement
                    </label>
                </div>
                <a href="" class="btn btn-login btn-danger btn-float"><i class="zmdi zmdi-arrow-forward"></i></a>
                <ul class="login-navigation">
                    <li data-block="#l-login" class="bgm-green" data-ng-click="lctrl.register = 0; lctrl.login = 1">Login</li>
                    <li data-block="#l-forget-password" class="bgm-orange" data-ng-click="lctrl.register = 0; lctrl.forgot = 1">Forgot Password?</li>
                </ul>
            </div>
            <div class="lc-block" id="l-forget-password" data-ng-class="{ 'toggled': lctrl.forgot === 1 }" data-ng-if="lctrl.forgot === 1">
                <h1 class="lean">Azrael</h1>
                <p class="text-left">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu risus. Curabitur commodo lorem fringilla enim feugiat commodo sed ac lacus.</p>
                <div class="input-group m-b-20">
                    <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
                    <div class="fg-line">
                        <input type="text" class="form-control" placeholder="Email Address" regex="^\w+@\w+\.[a-zA-Z]+(\.[a-zA-Z]+)?$"/>
                    </div>
                </div>
                <a href="" class="btn btn-login btn-danger btn-float"><i class="zmdi zmdi-arrow-forward"></i></a>
                <ul class="login-navigation">
                    <li data-block="#l-login" class="bgm-green" data-ng-click="lctrl.forgot = 0; lctrl.login = 1">Login</li>
                    <li data-block="#l-register" class="bgm-red" data-ng-click="lctrl.forgot = 0; lctrl.register = 1">Register</li>
                </ul>
            </div>

        </div>
    </div>
</div>

<!-- Vendor CSS -->
<link href="${config.staticWebSite}/css/login/material-design-iconic-font.min.css" rel="stylesheet" type="text/css">
<!-- CSS -->
<link href="${config.staticWebSite}/css/login/app.min.1.css" rel="stylesheet" type="text/css">

<script src="${config.staticWebSite}/js/login/jquery.min.js"></script>
<script src="${config.staticWebSite}/js/login/log.js"></script>
<!-- Angular -->
<script src="${config.staticWebSite}/js/login/angular.min.js"></script>
<script src="${config.staticWebSite}/js/login/angular-resource.min.js"></script>
<script src="${config.staticWebSite}/js/login/angular-animate.min.js"></script>
<!-- Angular Modules -->
<script src="${config.staticWebSite}/js/login/angular-ui-router.min.js"></script>
<script src="${config.staticWebSite}/js/login/loading-bar.js"></script>
<script src="${config.staticWebSite}/js/login/oclazyload.min.js"></script>
<script src="${config.staticWebSite}/js/login/ui-bootstrap-tpls.min.js"></script>
<!-- Common js -->
<script src="${config.staticWebSite}/js/login/nouislider.min.js"></script>
<script src="${config.staticWebSite}/js/login/ng-table.min.js"></script>
<!-- Placeholder for IE9 -->
<!--[if IE 9 ]>
<script src="${config.staticWebSite}/js/login/jquery.placeholder.min.js"></script>
<![endif]-->
<!-- App level -->
<script src="${config.staticWebSite}/js/login/app.js"></script>
<script src="${config.staticWebSite}/js/login/main.js"></script>
<script src="${config.staticWebSite}/js/login/ui-bootstrap.js"></script>
<!-- Template Modules -->
<script src="${config.staticWebSite}/js/login/form.js"></script>

<script type="text/javascript" src="${config.staticWebSite}/js/zhyd.core.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/zhyd.comment.js"></script>
<script type="text/javascript" src="${config.staticWebSite}/js/zhyd.js"></script>