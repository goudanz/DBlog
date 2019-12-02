package com.zyd.blog.controller;

import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.annotation.BussinessLog;
import com.zyd.blog.business.entity.Cats;
import com.zyd.blog.business.enums.ResponseStatus;
import com.zyd.blog.business.service.BizCatsService;
import com.zyd.blog.business.vo.CatsConditionVO;
import com.zyd.blog.framework.object.PageResult;
import com.zyd.blog.framework.object.ResponseVO;
import com.zyd.blog.util.ResultUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 文章猫片管理
 *
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2018/4/24 14:37
 * @since 1.0
 */
@RestController
@RequestMapping("/cat")
public class RestCatController {
    @Autowired
    private BizCatsService catsService;

    @RequiresPermissions("cats")
    @PostMapping("/list")
    public PageResult list(CatsConditionVO vo) {
        PageInfo<Cats> pageInfo = catsService.findPageBreakByCondition(vo);
        return ResultUtil.tablePage(pageInfo);
    }

    @RequiresPermissions("cat:add")
    @PostMapping(value = "/add")
    @BussinessLog("添加猫片")
    public ResponseVO add(Cats cats) {
        cats = catsService.insert(cats);
        return ResultUtil.success("猫片添加成功！新猫片 - " + cats.getName(), cats);
    }

    @RequiresPermissions(value = {"cat:batchDelete", "cat:delete"}, logical = Logical.OR)
    @PostMapping(value = "/remove")
    @BussinessLog("删除猫片")
    public ResponseVO remove(Long[] ids) {
        if (null == ids) {
            return ResultUtil.error(500, "请至少选择一条记录");
        }
        for (Long id : ids) {
            catsService.removeByPrimaryKey(id);
        }
        return ResultUtil.success("成功删除 [" + ids.length + "] 个猫片");
    }

    @RequiresPermissions("cat:get")
    @PostMapping("/get/{id}")
    @BussinessLog("获取猫片详情")
    public ResponseVO get(@PathVariable Long id) {
        return ResultUtil.success(null, this.catsService.getByPrimaryKey(id));
    }

    @RequiresPermissions("cat:edit")
    @PostMapping("/edit")
    @BussinessLog("编辑猫片")
    public ResponseVO edit(Cats cats) {
        try {
            catsService.updateSelective(cats);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("猫片修改失败！");
        }
        return ResultUtil.success(ResponseStatus.SUCCESS);
    }

    @PostMapping("/listAll")
    public ResponseVO list() {
        return ResultUtil.success(null, catsService.listAll());
    }

}
