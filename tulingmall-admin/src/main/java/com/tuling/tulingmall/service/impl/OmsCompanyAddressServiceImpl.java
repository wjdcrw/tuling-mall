package com.tuling.tulingmall.service.impl;

import com.tuling.tulingmall.mapper.OmsCompanyAddressMapper;
import com.tuling.tulingmall.model.OmsCompanyAddress;
import com.tuling.tulingmall.model.OmsCompanyAddressExample;
import com.tuling.tulingmall.service.OmsCompanyAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 收货地址管理Service实现类
 * Created on 2018/10/18.
 */
@Service
public class OmsCompanyAddressServiceImpl implements OmsCompanyAddressService {
    @Autowired
    private OmsCompanyAddressMapper companyAddressMapper;
    @Override
    public List<OmsCompanyAddress> list() {
        return companyAddressMapper.selectByExample(new OmsCompanyAddressExample());
    }
}
