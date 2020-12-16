package com.tuling.tulingmall.exception;



import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.exception.GateWayException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;


@Slf4j
@Component
public class GateWayExceptionHandlerAdvice {

    @ExceptionHandler(value = {GateWayException.class})
    public CommonResult handle(GateWayException ex) {
        log.error("网关异常code:{},msg:{}", ex.getCode(),ex.getMessage());
        return CommonResult.failed(ex.getCode(),ex.getMessage());
    }

    @ExceptionHandler(value = {Throwable.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public CommonResult handle(Throwable throwable) {

        if(throwable instanceof GateWayException) {
            return handle((GateWayException) throwable);
        }else {
            return CommonResult.failed();
        }
    }
}
