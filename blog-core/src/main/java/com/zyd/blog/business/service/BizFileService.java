package com.zyd.blog.business.service;


import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.entity.File;
import com.zyd.blog.business.vo.FileConditionVO;
import com.zyd.blog.framework.object.AbstractService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author innodev java team
 * @version 1.0
 * @date 2018/12/14 09:23
 * @since 1.8
 */
public interface BizFileService extends AbstractService<File, Long> {

    List<File> queryBizResourceFile(int pageSize);

    PageInfo<File> findPageBreakByCondition(FileConditionVO vo);

    PageInfo<File> findResourceByCondition(FileConditionVO vo);

    File selectFileByPathAndUploadType(String filePath, String uploadType);

    void remove(Long[] ids);

    int uploadCommon(MultipartFile[] file);

    int uploadFile(MultipartFile[] file);
}
