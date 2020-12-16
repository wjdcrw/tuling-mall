package com.tuling.component;

import com.tuling.domin.MemberDetails;
import com.tuling.tulingmall.mapper.UmsMemberMapper;
import com.tuling.tulingmall.model.UmsMember;
import com.tuling.tulingmall.model.UmsMemberExample;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.List;

/**
 * @Description: 认证服务器加载用户的类
 * @Author dcr
 * @Date 2020/12/13 9:47
 */
@Slf4j
@Component
public class TulingUserDetailService implements UserDetailsService {

    @Autowired
    private UmsMemberMapper umsMemberMapper;

    /** 
     * @Description: 用户登录
     * @Param: [userName] 用户名密码
     * @return: org.springframework.security.core.userdetails.UserDetails 
     * @Author: dcr
     * @Date: 2020/12/13 9:47
     */
    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        if(StringUtils.isEmpty(userName)){
            log.warn("用户登录用户名为空:{}",userName);
            throw new UsernameNotFoundException("用户名不能为空");
        }

        UmsMember umsMember = getByUsername(userName);

        if(null==umsMember){
            log.warn("根据用户名没有查询到对应的用户信息:{}",userName);
        }

        log.info("根据用户名:{}获取用户登陆信息:{}",userName,umsMember);

        MemberDetails memberDetails=new MemberDetails(umsMember);
        return memberDetails;
    }

    /** 
     * @Description: 根据用户名获取会员信息 
     * @Param: [userName] 用户名
     * @return: com.tuling.tulingmall.model.UmsMember 会员对象
     * @Author: dcr
     * @Date: 2020/12/13 9:53
     */
    public UmsMember getByUsername(String userName){
        UmsMemberExample example=new UmsMemberExample();
        example.createCriteria().andUsernameEqualTo(userName);
        List<UmsMember> memberList = umsMemberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(memberList)){
            return memberList.get(0);
        }
        return null;
    }
}
