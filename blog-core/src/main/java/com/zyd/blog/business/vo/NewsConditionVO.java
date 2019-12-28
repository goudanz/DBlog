package com.zyd.blog.business.vo;

import com.zyd.blog.business.entity.Cats;
import com.zyd.blog.business.entity.News;
import com.zyd.blog.framework.object.BaseConditionVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @version 1.0
 * @website https://www.dancoder.cn
 * @date 2019/12/286 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class NewsConditionVO extends BaseConditionVO {
	private News news;
}

