package com.tuling.tulingmall.portal.service;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.model.PmsComment;
import com.tuling.tulingmall.model.PmsCommentReplay;
import org.springframework.transaction.annotation.Transactional;

/**
 *                  ,;,,;
 *                ,;;'(    社
 *      __      ,;;' ' \   会
 *   /'  '\'~~'~' \ /'\.)  主
 * ,;(      )    /  |.     义
 *,;' \    /-.,,(   ) \    码
 *     ) /       ) / )|    农
 *     ||        ||  \)     
 *     (_\       (_\
 * @author ：杨过
 * @date ：Created in 2020/2/9 14:55
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 
 **/
public interface PortalProductCommentService {
    /**
     * 获取评论列表
     * @param productId
     * @param pageNum
     * @param pageSize
     * @return
     */
    CommonResult getCommentList(Long productId, Integer pageNum, Integer pageSize);

    /**
     * 用户评价
     * @param pmsComment
     * @return
     */
    @Transactional
    Integer insertProductComment(PmsComment pmsComment);

    /**
     * 用户评价回复
     * @param replay
     * @return
     */
    @Transactional
    Integer insertCommentReply(PmsCommentReplay replay);

}
