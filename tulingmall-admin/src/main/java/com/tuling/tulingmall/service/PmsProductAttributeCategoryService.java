package com.tuling.tulingmall.service;

import com.tuling.tulingmall.dto.PmsProductAttributeCategoryItem;
import com.tuling.tulingmall.model.PmsProductAttributeCategory;

import java.util.List;

/**
 * 商品属性分类Service
 * Created on 2018/4/26.
 */
public interface PmsProductAttributeCategoryService {
    int create(String name);

    int update(Long id, String name);

    int delete(Long id);

    PmsProductAttributeCategory getItem(Long id);

    List<PmsProductAttributeCategory> getList(Integer pageSize, Integer pageNum);

    List<PmsProductAttributeCategoryItem> getListWithAttr();
}
