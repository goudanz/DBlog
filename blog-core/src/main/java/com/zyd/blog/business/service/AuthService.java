package com.zyd.blog.business.service;

import me.zhyd.oauth.model.AuthCallback;

/**
 * @author dancoder
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2019/5/25 14:32
 * @since 1.8
 */
public interface AuthService {

    boolean login(String source, AuthCallback callback);

    boolean revoke(String source, Long userId);

    void logout();
}
