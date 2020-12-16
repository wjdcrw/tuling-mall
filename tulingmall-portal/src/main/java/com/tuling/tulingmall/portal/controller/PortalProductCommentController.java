package com.tuling.tulingmall.portal.controller;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.model.PmsComment;
import com.tuling.tulingmall.model.PmsCommentReplay;
import com.tuling.tulingmall.portal.domain.PmsCommentParam;
import com.tuling.tulingmall.portal.service.PortalProductCommentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
 * @date ：Created in 2020/2/9 13:00
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 
 **/
@RestController
@Api(tags = "PortalProductCommentController", description = "商品评论管理#杨过添加")
public class PortalProductCommentController {
    @Autowired
    private PortalProductCommentService commentService;

    @ApiOperation("产品评论信息列表#杨过添加")
    @GetMapping(value = "/portal/commentlist/{productId}")
    public CommonResult<List<PmsCommentParam>> getCommentList(
            @PathVariable Long productId,
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize){
        return commentService.getCommentList(productId,pageNum,pageSize);
    }

    @ApiOperation("发布产品评论#杨过添加")
    @RequestMapping(value = "/portal/sendComment",method = RequestMethod.POST)
    public CommonResult sendProductComment(@RequestBody PmsComment pmsComment){
        Integer result = commentService.insertProductComment(pmsComment);
        if(result > 0){
            return CommonResult.success(null);
        }else if(result == -1){
            return CommonResult.failed("您没有购买过当前商品,无法评价！");
        }
        return CommonResult.failed();
    }

    @ApiOperation("产品评论回复#杨过添加")
    @RequestMapping(value = "/portal/sendCommentReply",method = RequestMethod.POST)
    public CommonResult sendProductCommentReply(@RequestBody PmsCommentReplay commentReplay){
        Integer result = commentService.insertCommentReply(commentReplay);
        if(result > 0){
            return CommonResult.success(null);
        }
        return CommonResult.failed();
    }
}
