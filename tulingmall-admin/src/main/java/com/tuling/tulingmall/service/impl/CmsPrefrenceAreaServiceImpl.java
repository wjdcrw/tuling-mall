package com.tuling.tulingmall.service.impl;

import com.tuling.tulingmall.mapper.CmsPrefrenceAreaMapper;
import com.tuling.tulingmall.model.CmsPrefrenceArea;
import com.tuling.tulingmall.model.CmsPrefrenceAreaExample;
import com.tuling.tulingmall.service.CmsPrefrenceAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品优选Service实现类
 * Created on 2018/6/1.
 */
@Service
public class CmsPrefrenceAreaServiceImpl implements CmsPrefrenceAreaService {
    @Autowired
    private CmsPrefrenceAreaMapper prefrenceAreaMapper;

    @Override
    public List<CmsPrefrenceArea> listAll() {
        return prefrenceAreaMapper.selectByExample(new CmsPrefrenceAreaExample());
    }
}
