package com.tuling.tulingmall.portal.domain;

import com.tuling.tulingmall.model.PmsComment;
import com.tuling.tulingmall.model.PmsCommentReplay;
import lombok.Data;

import java.util.List;

/**
 *                 ,;,,;
 *               ,;;'(    社
 *      __      ,;;' ' \  会
 *  /'  '\'~~'~' \ /'\.)  主
 *  ,;(      )    /  |.   义
 *  ,;' \    /-.,,(   ) \ 码
 *  ) /       ) / )|      农
 *  ||        ||  \)
 * (_\       (_\
 *
 * @author ：杨过
 * @date ：Created in 2020/2/9
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
@Data
public class PmsCommentParam extends PmsComment {
    private List<PmsCommentReplay> pmsCommentReplayList;
}
