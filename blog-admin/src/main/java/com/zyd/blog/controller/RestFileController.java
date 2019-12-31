package com.zyd.blog.controller;

import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.annotation.BussinessLog;
import com.zyd.blog.business.service.BizFileService;
import com.zyd.blog.business.vo.FileConditionVO;
import com.zyd.blog.framework.object.ResponseVO;
import com.zyd.blog.util.ResultUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件管理
 *
 * @author dancoder
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2019/2/14 11:37
 * @since 1.0
 */
@RestController
@RequestMapping("/file")
public class RestFileController {
    @Autowired
    private BizFileService fileService;

    @RequiresPermissions("files")
    @PostMapping("/list")
    public PageInfo list(FileConditionVO vo) {
        vo.setPageSize(20);
        return fileService.findPageBreakByCondition(vo);
    }

    @RequiresPermissions("files")
    @PostMapping(value = "/remove")
    @BussinessLog("删除文件，ids:{1}")
    public ResponseVO remove(Long[] ids) {
        if (null == ids) {
            return ResultUtil.error(500, "请至少选择一条记录");
        }
        fileService.remove(ids);

        return ResultUtil.success("成功删除 [" + ids.length + "] 张图片");
    }

    @RequiresPermissions("files")
    @PostMapping(value = "/add")
    @BussinessLog("添加文件")
    public ResponseVO add(MultipartFile[] file) {
        if (null == file || file.length == 0) {
            return ResultUtil.error("请至少选择一张图片！");
        }
        int res = fileService.uploadCommon(file);
        return ResultUtil.success("成功上传" + res + "张图片");
    }

//    resource 资源文件

    @RequiresPermissions("files")
    @PostMapping("/list/resource")
    public PageInfo listResource(FileConditionVO vo) {
        vo.setPageSize(20);
        return fileService.findResourceByCondition(vo);
    }

    @RequiresPermissions("files")
    @PostMapping(value = "/add-resource")
    @BussinessLog("添加文件")
    public ResponseVO addResource(MultipartFile[] file) {
        if (null == file || file.length == 0) {
            return ResultUtil.error("请至少选择一个文件！");
        }
        int res = fileService.uploadFile(file);
        return ResultUtil.success("成功上传");
    }
}
