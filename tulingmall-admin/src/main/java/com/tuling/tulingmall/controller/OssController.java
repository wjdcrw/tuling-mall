package com.tuling.tulingmall.controller;


import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.dto.OssCallbackResult;
import com.tuling.tulingmall.dto.OssPolicyResult;
import com.tuling.tulingmall.service.impl.OssServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * Oss相关操作接口
 * Created on 2018/4/26.
 */
@Slf4j
@Controller
@Api(tags = "OssController", description = "Oss管理")
@RequestMapping("/aliyun/oss")
public class OssController {
    @Autowired
    private OssServiceImpl ossService;

    @ApiOperation(value = "oss上传签名生成")
    @RequestMapping(value = "/policy", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<OssPolicyResult> policy() {
        OssPolicyResult result = ossService.policy();
        return CommonResult.success(result);
    }

    @ApiOperation(value = "oss上传成功回调")
    @RequestMapping(value = "callback", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<OssCallbackResult> callback(HttpServletRequest request) {
        log.info("oss callback回调成功......");
        OssCallbackResult ossCallbackResult = ossService.callback(request);
        return CommonResult.success(ossCallbackResult);
    }

    @Value("${upload.product.images}")
    private String uploadBasePath;

    /**
     * add by 杨过,图片上传到本地不上传到aliyun-OSS
     * @param multiFile
     * @param req
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @CrossOrigin
    @ResponseBody
    public CommonResult<String> importData(@RequestParam("image-file") MultipartFile multiFile, HttpServletRequest req) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");
        String format = sdf.format(new Date());
        /*
         * 按日期分类
         */
        String realPath = uploadBasePath + format;
        File folder = new File(realPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        String oldName = multiFile.getOriginalFilename();
        String newName = UUID.randomUUID().toString() + oldName.substring(oldName.lastIndexOf("."));

        multiFile.transferTo(new File(folder,newName));
        //String url = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + "/upload" + format + newName;
        String httpBasePath = "/upload/product/images" + format + newName;

        return CommonResult.success(httpBasePath);
    }

}
