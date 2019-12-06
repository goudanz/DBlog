package com.zyd.blog.business.service.impl;

import com.zyd.blog.business.entity.User;
import com.zyd.blog.business.enums.UserTypeEnum;
import com.zyd.blog.business.service.GuestService;
import com.zyd.blog.business.service.SysUserService;
import com.zyd.blog.framework.exception.ZhydException;
import com.zyd.blog.util.PasswordUtil;
import com.zyd.blog.util.RegexUtils;
import com.zyd.blog.util.SessionUtil;
import me.zhyd.oauth.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.UUID;

@Service
public class GuestServiceImpl implements GuestService {

    @Autowired
    private SysUserService userService;

    @Override
    public User login(User user) {
        if (StringUtils.isEmpty(user.getUsername())){
            throw new ZhydException("用户名不能为空");
        }
        if (StringUtils.isEmpty(user.getPassword())){
            throw new ZhydException("密码不能为空");
        }

        if (RegexUtils.isSpecialChar(user.getUsername())) {
            throw new ZhydException("用户名不能包含特殊字符");
        }
        if (RegexUtils.isSpecialChar(user.getPassword())) {
            throw new ZhydException("密码不能包含特殊字符");
        }

        User loginUser = userService.getByUserName(user.getUsername());
        if (null == loginUser){
            throw new ZhydException("此用户不存在，清检查您的用户名是否正确！");
        }

        String inputPwd;
        try {
            inputPwd = PasswordUtil.encrypt(user.getPassword(), user.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ZhydException("密码加密失败");
        }

        if (!inputPwd.equals(loginUser.getPassword())){
            throw new ZhydException("请输入正确的密码");
        }
        SessionUtil.setUser(loginUser);
        userService.updateUserLastLoginInfo(loginUser);
        return loginUser;
    }

    @Override
    public User register(User user) {
        if (StringUtils.isEmpty(user.getUsername())){
            throw new ZhydException("用户名不能为空");
        }
        if (StringUtils.isEmpty(user.getPassword())){
            throw new ZhydException("密码不能为空");
        }
        if (StringUtils.isEmpty(user.getEmail())){
            throw new ZhydException("邮箱不能为空");
        }
        if (RegexUtils.isSpecialChar(user.getUsername())) {
            throw new ZhydException("用户名不能包含特殊字符");
        }
        if (RegexUtils.isSpecialChar(user.getPassword())) {
            throw new ZhydException("密码不能包含特殊字符");
        }
        try {
            user.setEmail(URLDecoder.decode(user.getEmail(),"utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        try {
            user.setPassword(PasswordUtil.encrypt(user.getPassword(), user.getUsername()));
        } catch (Exception e) {
            e.printStackTrace();
            throw new ZhydException("密码加密失败");
        }
        user.setUserType(UserTypeEnum.USER);
        user.setUuid(UUID.randomUUID().toString());
        User nweUser = userService.insert(user);
        return nweUser;
    }
}
