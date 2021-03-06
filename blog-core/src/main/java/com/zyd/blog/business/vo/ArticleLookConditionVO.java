package com.zyd.blog.business.vo;

import com.zyd.blog.business.entity.ArticleLook;
import com.zyd.blog.framework.object.BaseConditionVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author dancoder
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2018/4/16 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ArticleLookConditionVO extends BaseConditionVO {
	private ArticleLook articleLook;
}

