package com.tuling.tulingmall.component.zklock;

/**
 * @author ：杨过
 * @date ：Created in 2020/2/19
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
public interface ZKLock {

    boolean lock(String lockpath);

    boolean unlock(String lockpath);

}
