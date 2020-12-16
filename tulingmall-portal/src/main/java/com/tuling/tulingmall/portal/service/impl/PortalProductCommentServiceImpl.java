package com.tuling.tulingmall.portal.service.impl;

import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.mapper.PmsCommentMapper;
import com.tuling.tulingmall.mapper.PmsCommentReplayMapper;
import com.tuling.tulingmall.model.PmsComment;
import com.tuling.tulingmall.model.PmsCommentReplay;
import com.tuling.tulingmall.model.UmsMember;
import com.tuling.tulingmall.portal.dao.PortalProductCommentDao;
import com.tuling.tulingmall.portal.domain.PmsCommentParam;
import com.tuling.tulingmall.portal.feignapi.ums.UmsMemberFeignApi;
import com.tuling.tulingmall.portal.service.PortalProductCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author ：杨过
 * @date ：Created in 2020/2/9
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
@Service
public class PortalProductCommentServiceImpl implements PortalProductCommentService {
    @Autowired
    private PortalProductCommentDao productCommentDao;

    @Autowired
    private PmsCommentMapper pmsMapper;

    @Autowired
    private PmsCommentReplayMapper replayMapper;

    @Autowired
    private UmsMemberFeignApi umsMemberFeignApi;

    /**
     * 获取评论列表
     * @param productId
     * @return
     */
    @Override
    public CommonResult<List<PmsCommentParam>> getCommentList(Long productId, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return CommonResult.success(productCommentDao.getCommentList(productId));
    }

    /**
     * 用户评价
     * @param pmsComment
     * @return
     */
    @Override
    public Integer insertProductComment(PmsComment pmsComment) {
        UmsMember member = umsMemberFeignApi.getMemberById().getData();
        //判断一下当前用户是否购买过当前评论的商品
        Integer status = productCommentDao.selectUserOrder(member.getId(), pmsComment.getProductId());
        if(status > 0){
            pmsComment.setCreateTime(new Date());
            pmsComment.setShowStatus(0);
            pmsComment.setMemberNickName(member.getNickname());
            pmsComment.setMemberIcon(member.getIcon());
            return pmsMapper.insert(pmsComment);
        }
        return -1;
    }

    /**
     * 用户评价回复
     * @param reply
     * @return
     */
    @Override
    public Integer insertCommentReply(PmsCommentReplay reply) {
        UmsMember member = umsMemberFeignApi.getMemberById().getData();
        reply.setCreateTime(new Date());
        reply.setMemberNickName(member.getNickname());
        reply.setMemberIcon(member.getIcon());
        reply.setType(0);
        return replayMapper.insert(reply);
    }
}
