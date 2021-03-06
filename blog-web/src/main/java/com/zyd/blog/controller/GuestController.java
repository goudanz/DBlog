package com.zyd.blog.controller;

import com.zyd.blog.business.entity.User;
import com.zyd.blog.business.service.GuestService;
import com.zyd.blog.framework.exception.ZhydException;
import com.zyd.blog.framework.object.ResponseVO;
import com.zyd.blog.util.ResultUtil;
import me.zhyd.oauth.model.AuthCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/guest")
public class GuestController {

    @Autowired
    private GuestService guestService;

    @RequestMapping("/register")
    public ResponseVO register(HttpSession session, User user) {
        guestService.register(user);
        return ResultUtil.success("注册成功！", null);
    }

    @RequestMapping("/login")
    public ResponseVO login(HttpSession session, User user) {
        try{
            guestService.login(user);
        }catch (ZhydException e){
            return ResultUtil.error(e.getMessage());
        }

        String historyUrl = (String) session.getAttribute("historyUrl");
        session.removeAttribute("historyUrl");
        if (StringUtils.isEmpty(historyUrl)) {
            return ResultUtil.success(null, historyUrl);
        }
        return ResultUtil.success(null, historyUrl);
    }
}
