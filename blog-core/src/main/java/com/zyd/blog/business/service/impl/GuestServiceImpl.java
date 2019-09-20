package com.zyd.blog.business.service.impl;

import com.zyd.blog.business.entity.User;
import com.zyd.blog.business.enums.UserTypeEnum;
import com.zyd.blog.business.service.GuestService;
import com.zyd.blog.business.service.SysUserService;
import com.zyd.blog.framework.exception.ZhydCommentException;
import com.zyd.blog.util.PasswordUtil;
import com.zyd.blog.util.SessionUtil;
import me.zhyd.oauth.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.UUID;

@Service
public class GuestServiceImpl implements GuestService {

    @Autowired
    private SysUserService userService;

    @Override
    public User login(User user) {
        if (StringUtils.isEmpty(user.getUsername())){
            throw new ZhydCommentException("用户名不能为空");
        }
        if (StringUtils.isEmpty(user.getPassword())){
            throw new ZhydCommentException("密码不能为空");
        }

        User loginUser = userService.getByUserName(user.getUsername());
        if (null == loginUser){
            throw new ZhydCommentException("此用户不存在，清检查您的用户名是否正确！");
        }

        String inputPwd = null;
        try {
            inputPwd = PasswordUtil.encrypt(user.getPassword(), user.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ZhydCommentException("密码加密失败");
        }

        if (!inputPwd.equals(loginUser.getPassword())){
            throw new ZhydCommentException("请输入正确的密码");
        }
        SessionUtil.setUser(loginUser);
        userService.updateUserLastLoginInfo(loginUser);
        return loginUser;
    }

    @Override
    public void register(User user) {
        if (StringUtils.isEmpty(user.getUsername())){
            throw new ZhydCommentException("用户名不能为空");
        }
        if (StringUtils.isEmpty(user.getPassword())){
            throw new ZhydCommentException("密码不能为空");
        }
        if (StringUtils.isEmpty(user.getEmail())){
            throw new ZhydCommentException("邮箱不能为空");
        }
        try {
            user.setPassword(PasswordUtil.encrypt(user.getPassword(), user.getUsername()));
        } catch (Exception e) {
            e.printStackTrace();
            throw new ZhydCommentException("密码加密失败");
        }
        user.setUserType(UserTypeEnum.USER);
        user.setUuid(UUID.randomUUID().toString());
        userService.insert(user);
    }
}
