package com.tuling.tulingmall.portal.controller.handler;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.exception.BusinessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

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
 * @date ：Created in 2020/1/5 16:56
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 全局异常处理，避免异常敏感信息直接暴露给客户端
 **/
@ControllerAdvice
public class RequestBadExceptionHandler {

    /**
     * 兜底异常捕捉
     * @param e
     * @return
     */
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public CommonResult<String> ExepitonHandler(Exception e){
        if(e instanceof BusinessException){
            BusinessException businessException = (BusinessException)e;
        }
        return CommonResult.failed("请求错误:->"+e.getMessage());
    }

    //可自定义异常，执行捕捉

}
