package com.zyd.blog.plugin.oauth;

import me.zhyd.oauth.request.AuthRequest;

/**
 * @author dancoder
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2019/5/23 18:32
 * @since 1.8
 */
public interface OauthRequest {

    AuthRequest getRequest();
}
