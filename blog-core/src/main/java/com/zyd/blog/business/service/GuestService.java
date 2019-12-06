package com.zyd.blog.business.service;

import com.zyd.blog.business.entity.User;

public interface GuestService {

    User login(User user);

    User register(User user);
}
