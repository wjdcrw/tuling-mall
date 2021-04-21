package com.tuling.tulingmall.domain;

import com.tuling.tulingmall.model.SmsFlashPromotionSession;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author ：杨过
 * @date ：Created in 2020/1/8
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
@Data
public class FlashPromotionSessionExt extends SmsFlashPromotionSession {
    @ApiModelProperty(value = "活动状态#根据时间进行判断",notes = "0->进行中,1->即将开始,2->已结束")
    private Integer sessionStatus;
    @ApiModelProperty(value = "当前秒杀活动ID")
    private Long flashPromotionId;
}
