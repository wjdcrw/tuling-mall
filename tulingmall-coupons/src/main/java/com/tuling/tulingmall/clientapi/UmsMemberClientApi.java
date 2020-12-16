package com.tuling.tulingmall.clientapi;


import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.model.UmsMember;
import com.tuling.tulingmall.clientapi.interceptor.config.FeignConfig;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* @vlog: 高于生活，源于生活
* @desc: 类的描述:Feign远程调用用户服务接口
* @author: smlz
* @createDate: 2020/1/14 21:44
* @version: 1.0
*/
@FeignClient(name = "tulingmall-member", configuration = FeignConfig.class)
public interface UmsMemberClientApi {

    @RequestMapping(value = "/getCurrentMember", method = RequestMethod.GET)
    @ResponseBody
    CommonResult<UmsMember> getCurrentMember();
}
